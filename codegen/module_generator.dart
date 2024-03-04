import 'dart:io';

void main() async {
  print("Enter module name: ... (example: profile) ");
  // Reading name of the Geek
  String input = await stdin.readLineSync() ?? "";
  String module = input.toLowerCase();

  // Define the list of folders and files
  List<String> folders = [
    'lib/features/$module/data/local',
    'lib/features/$module/data/model/mapper',
    'lib/features/$module/data/model/responses',
    'lib/features/$module/data/remote',
    'lib/features/$module/di',
    'lib/features/$module/domain',
    'lib/features/$module/domain/model',
    'lib/features/$module/domain/repository',
    'lib/features/$module/domain/use_cases',
    'lib/features/$module/presentation/blocs/events',
    'lib/features/$module/presentation/blocs/states',
    'lib/features/$module/presentation/blocs',
    'lib/features/$module/presentation/pages',
    'lib/features/$module/presentation/widgets',
  ];

  List<String> files = [
    'lib/features/$module/data/local/${module}_local_data_sources.dart',
    'lib/features/$module/data/model/mapper/${module}_mapper.dart',
    'lib/features/$module/data/model/responses/${module}_response.dart',
    'lib/features/$module/data/remote/${module}_remote_data_sources.dart',
    'lib/features/$module/data/${module}_repository_impl.dart',
    'lib/features/$module/di/${module}_module.dart',
    'lib/features/$module/domain/model/$module.dart',
    'lib/features/$module/domain/repository/${module}_repository.dart',
    'lib/features/$module/domain/use_cases/${module}_use_cases.dart',
    'lib/features/$module/domain/${module}_interactor.dart',
    'lib/features/$module/presentation/blocs/events/get_${module}_event.dart',
    'lib/features/$module/presentation/blocs/states/get_${module}_states.dart',
    'lib/features/$module/presentation/blocs/${module}_bloc.dart',
    'lib/features/$module/presentation/blocs/${module}_events.dart',
    'lib/features/$module/presentation/blocs/${module}_states.dart',
    'lib/features/$module/presentation/pages/${module}_page.dart',
    'lib/features/$module/presentation/widgets/${module}_info_widget.dart',
  ];

  // Create folders
  for (String folder in folders) {
    createFolder(folder);
  }

  // Create files
  for (String file in files) {
    File plainFile = await createFile(file);
    writeFile(plainFile, file, module, files);
  }

  print('Folders and files created successfully!');
}

void createFolder(String folderPath) {
  Directory(folderPath).create(recursive: true).then((Directory directory) {
    print('Folder created: ${directory.path}');
  });
}

Future<File> createFile(String filePath) async {
  return await File(filePath).create(recursive: true);
}

void writeFile(File file, String fileName, String module, List<String> files) {
  String content = getContent(fileName, module, files);

  file.writeAsString(content, mode: FileMode.append).then((File file) {
    print('File name written to ${file.path}');
  });
}

String getContent(String fileName, String module, List<String> files) {
  final className = toUpperCaseFirst(module);
  if (fileName == files[0]) {
    return writeLocalDataSource(className);
  } else if (fileName == files[1]) {
    return writeMapper(className);
  } else if (fileName == files[2]) {
    return writeResponse(className);
  } else if (fileName == files[3]) {
    return writeRemoteDataSource(className);
  } else if (fileName == files[4]) {
    return writeRepositoryImpl(className);
  } else if (fileName == files[5]) {
    return writeModule(className);
  } else if (fileName == files[6]) {
    return writeModel(className);
  } else if (fileName == files[7]) {
    return writeRepository(className);
  } else if (fileName == files[8]) {
    return writeUseCases(className);
  } else if (fileName == files[9]) {
    return writeInteractor(className);
  } else if (fileName == files[10]) {
    return writeGetModuleEvent(className);
  } else if (fileName == files[11]) {
    return writeGetModuleStates(className);
  } else if (fileName == files[12]) {
    return writeBloc(className);
  } else if (fileName == files[13]) {
    return writeEvents(className);
  } else if (fileName == files[14]) {
    return writeStates(className);
  } else if (fileName == files[15]) {
    return writePage(className);
  } else if (fileName == files[16]) {
    return writeInfoWidget(className);
  }
  return fileName;
}

String toUpperCaseFirst(String value) {
  StringBuffer buffer = StringBuffer();
  buffer.write(value[0].toUpperCase());
  buffer.write(value.substring(1));
  return buffer.toString();
}

String writeLocalDataSource(String module) {
  return '''
abstract class ${module}LocalDataSources {}

class ${module}LocalDataSourcesImpl implements ${module}LocalDataSources {
  ${module}LocalDataSourcesImpl();
}
''';
}

String writeMapper(String module) {
  return '''
class ${module}Mapper {
  static void mapResponseToDomain() {
    return;
  }
}

''';
}

String writeResponse(String module) {
  return '''
import 'package:freezed_annotation/freezed_annotation.dart';

part '${module.toLowerCase()}_response.freezed.dart';
part '${module.toLowerCase()}_response.g.dart';

@freezed
class ${module}Response with _\$${module}Response {
  const factory ${module}Response({
    required int id,
    required String ${module}name,
    required String email,
  }) = _${module}Response;

  factory ${module}Response.fromJson(Map<String, dynamic> json) =>
      _\$${module}ResponseFromJson(json);
}
''';
}

String writeRemoteDataSource(String module) {
  return '''
import 'package:boilerplate/core/client/network_service.dart';

abstract class ${module}RemoteDataSources {
  Future<void> getSomething();
}

class ${module}RemoteDataSourceImpl implements ${module}RemoteDataSources {
  final NetworkService networkService;

  const ${module}RemoteDataSourceImpl(this.networkService);

  @override
  Future<void> getSomething() async {
    return;
  }
}

''';
}

String writeRepositoryImpl(String module) {
  return '''
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/${module.toLowerCase()}/data/local/${module.toLowerCase()}_local_data_sources.dart';
import 'package:boilerplate/features/${module.toLowerCase()}/data/remote/${module.toLowerCase()}_remote_data_sources.dart';
import 'package:dartz/dartz.dart';

import '../../../core/client/api_call.dart';
import '../domain/repository/${module.toLowerCase()}_repository.dart';
import 'model/mapper/${module.toLowerCase()}_mapper.dart';

class ${module}RepositoryImpl implements ${module}Repository {
  final ${module}RemoteDataSources _remoteDataSources;
  final ${module}LocalDataSources _localDataSources;

  const ${module}RepositoryImpl(this._remoteDataSources, this._localDataSources);

  @override
  Future<Either<NetworkException, void>> getSomething() {
    return apiCall<void>(
      func: _remoteDataSources.getSomething(),
      mapper: (_) => ${module}Mapper.mapResponseToDomain(),
    );
  }
}
''';
}

String writeModule(String module) {
  return '''
import '/core/client/network_service.dart';
import '/features/${module.toLowerCase()}/data/local/${module.toLowerCase()}_local_data_sources.dart';
import '/features/${module.toLowerCase()}/data/${module.toLowerCase()}_repository_impl.dart';
import '/features/${module.toLowerCase()}/data/remote/${module.toLowerCase()}_remote_data_sources.dart';
import '/features/${module.toLowerCase()}/domain/${module.toLowerCase()}_interactor.dart';
import '/features/${module.toLowerCase()}/domain/repository/${module.toLowerCase()}_repository.dart';
import '/features/${module.toLowerCase()}/domain/use_cases/${module.toLowerCase()}_use_cases.dart';
import '/features/${module.toLowerCase()}/presentation/blocs/${module.toLowerCase()}_bloc.dart';
import 'package:get_it/get_it.dart';

void register$module(GetIt di) {
  di.registerFactory<${module}RemoteDataSources>(
      () => ${module}RemoteDataSourceImpl(di<NetworkService>()));
  di.registerFactory<${module}LocalDataSources>(
      () => ${module}LocalDataSourcesImpl());
  di.registerFactory<${module}Repository>(() => ${module}RepositoryImpl(
      di<${module}RemoteDataSources>(), di<${module}LocalDataSources>()));
  di.registerFactory<${module}UseCases>(
      () => ${module}Interactor(di<${module}Repository>()));
  di.registerLazySingleton<${module}Bloc>(
      () => ${module}Bloc(di<${module}UseCases>()));
}
''';
}

String writeRepository(String module) {
  return '''
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ${module}Repository {
  Future<Either<NetworkException, void>> getSomething();
}
''';
}

String writeModel(String module) {
  return '''
class $module {
  final int id;
  final String username;

  const $module({
    required this.id,
    required this.username,
  });
}
''';
}

String writeUseCases(String module) {
  return '''
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ${module}UseCases {
  Future<Either<NetworkException, void>> getSomething();
}
''';
}

String writeInteractor(String module) {
  return '''
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/${module.toLowerCase()}/domain/repository/${module.toLowerCase()}_repository.dart';
import 'package:boilerplate/features/${module.toLowerCase()}/domain/use_cases/${module.toLowerCase()}_use_cases.dart';
import 'package:dartz/dartz.dart';

class ${module}Interactor implements ${module}UseCases {
  final ${module}Repository _repository;

  const ${module}Interactor(this._repository);

  @override
  Future<Either<NetworkException, void>> getSomething() {
    return _repository.getSomething();
  }
}
''';
}

String writeGetModuleEvent(String module) {
  return '''
import '../${module.toLowerCase()}_events.dart';

class Get${module}Event extends ${module}Event {}
''';
}

String writeGetModuleStates(String module) {
  return '''
import '../${module.toLowerCase()}_states.dart';

class Get${module}InitState extends ${module}States {
  @override
  List<Object?> get props => [];
}

class Get${module}LoadingState extends ${module}States {
  @override
  List<Object?> get props => [];
}

class Get${module}SuccessState extends ${module}States {
  final List<String> items;

  Get${module}SuccessState({required this.items});

  @override
  List<Object?> get props => [items];
}

class Get${module}ErrorState extends ${module}States {
  final String message;

  Get${module}ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

''';
}

String writeBloc(String module) {
  return '''
import 'package:boilerplate/features/${module.toLowerCase()}/presentation/blocs/states/get_${module.toLowerCase()}_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/${module.toLowerCase()}_use_cases.dart';
import 'events/get_${module.toLowerCase()}_event.dart';
import '${module.toLowerCase()}_events.dart';
import '${module.toLowerCase()}_states.dart';

class ${module}Bloc extends Bloc<${module}Event, ${module}States> {
  final ${module}UseCases _useCases;

  ${module}Bloc(this._useCases) : super(Get${module}InitState()) {
    on<Get${module}Event>(_onGet${module}Event);
  }

  Future _onGet${module}Event(
      Get${module}Event event, Emitter<${module}States> emitter) async {
    emitter(Get${module}InitState());
    final response = await _useCases.getSomething();
    await response.fold(
      (l) {
        emitter(
          Get${module}ErrorState(message: l.message ?? ''),
        );
      },
      (r) async {
        emitter(Get${module}SuccessState(items: ['']));
      },
    );
  }
}
''';
}

String writeEvents(String module) {
  return '''
abstract class ${module}Event {}
''';
}

String writeStates(String module) {
  return '''
import 'package:equatable/equatable.dart';

abstract class ${module}States extends Equatable {}
''';
}

String writePage(String module) {
  return '''
import 'package:flutter/material.dart';

class ${module}Page extends StatelessWidget {
  const ${module}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
''';
}

String writeInfoWidget(String module) {
  return '''
import 'package:flutter/material.dart';

class ${module}InfoWidget extends StatelessWidget {
  const ${module}InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
''';
}

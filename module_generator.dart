import 'dart:io';

void main() async {
  print("Enter module name: ... (example: profile) ");
  // Reading name of the Geek
  String module = await stdin.readLineSync() ?? "";

  // Define the list of folders and files
  List<String> folders = [
    'lib/features/${module}/data/local',
    'lib/features/${module}/data/model/mapper',
    'lib/features/${module}/data/model/responses',
    'lib/features/${module}/data/remote',
    'lib/features/${module}/di',
    'lib/features/${module}/domain',
    'lib/features/${module}/domain/model',
    'lib/features/${module}/domain/repository',
    'lib/features/${module}/domain/use_cases',
    'lib/features/${module}/presentation/blocs/events',
    'lib/features/${module}/presentation/blocs/states',
    'lib/features/${module}/presentation/blocs',
    'lib/features/${module}/presentation/pages',
    'lib/features/${module}/presentation/widgets',
  ];

  List<String> files = [
    'lib/features/${module}/data/local/${module}_local_data_sources.dart',
    'lib/features/${module}/data/model/mapper/${module}_mapper.dart',
    'lib/features/${module}/data/model/responses/${module}_response.dart',
    'lib/features/${module}/data/remote/${module}_remote_data_sources.dart',
    'lib/features/${module}/data/${module}_repository_impl.dart',
    'lib/features/${module}/di/${module}_module.dart',
    'lib/features/${module}/domain/model/${module}.dart',
    'lib/features/${module}/domain/repository/${module}_repository.dart',
    'lib/features/${module}/domain/use_cases/${module}_use_cases.dart',
    'lib/features/${module}/domain/${module}_interactor.dart',
    'lib/features/${module}/presentation/blocs/events/get_${module}_event.dart',
    'lib/features/${module}/presentation/blocs/states/get_${module}_states.dart',
    'lib/features/${module}/presentation/blocs/${module}_bloc.dart',
    'lib/features/${module}/presentation/blocs/${module}_events.dart',
    'lib/features/${module}/presentation/blocs/${module}_states.dart',
    'lib/features/${module}/presentation/pages/${module}_page.dart',
    'lib/features/${module}/presentation/widgets/${module}_info_widget.dart',
  ];

  // Create folders
  for (String folder in folders) {
    createFolder(folder);
  }

  // Create files
  for (String file in files) {
    createFile(file);
  }

  print('Folders and files created successfully!');
}

void createFolder(String folderPath) {
  Directory(folderPath).create(recursive: true).then((Directory directory) {
    print('Folder created: ${directory.path}');
  });
}

void createFile(String filePath) {
  File(filePath).create(recursive: true).then((File file) {
    print('File created: ${file.path}');
  });
}

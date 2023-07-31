import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:boilerplate/core/router/go.dart';
import 'package:boilerplate/design/widgets/secondary_scaffold.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_cubit.dart';
import 'package:boilerplate/features/main/presentation/widgets/item_card.dart';

import '../../../../services/di.dart';
import '../../domain/models/user.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late PagingController<int, User> _pagingController;
  late MainCubit _cubit;

  @override
  void initState() {
    _cubit = di<MainCubit>();
    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    await _cubit.getUsers(pageKey, _pagingController);
  }


  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
        title: "Third Screen",
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
                () => _pagingController.refresh(),
          ),
          child: PagedListView<int, User>(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<User>(
              itemBuilder: (context, item, index) => ItemCard(
                  onTap: (){
                    _cubit.selectUser(item.name);
                    Go.pop(context);
                  },
                  user: item,),
            ),
          ),
        ),
    );
  }
}

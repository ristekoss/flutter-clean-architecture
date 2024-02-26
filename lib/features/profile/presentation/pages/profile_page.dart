import 'package:boilerplate/design/constants/text_style.dart';
import 'package:boilerplate/design/widgets/atom/primary_button.dart';
import 'package:boilerplate/features/authentication/presentation/pages/login_page.dart';
import 'package:boilerplate/features/profile/presentation/blocs/authentication_bloc.dart';
import 'package:boilerplate/features/profile/presentation/blocs/events/get_user_event.dart';
import 'package:boilerplate/features/profile/presentation/blocs/profile_states.dart';
import 'package:boilerplate/features/profile/presentation/blocs/states/get_user_states.dart';
import 'package:boilerplate/features/profile/presentation/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../services/di.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const route = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    di<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        bloc: di<ProfileBloc>(),
        buildWhen: (p, n) {
          return n is GetUserInitState ||
              n is GetUserLoadingState ||
              n is GetUserErrorState ||
              n is GetUserSuccessState;
        },
        builder: (context, state) {
          if (state is GetUserSuccessState) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.network(state.user.image),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.user.username,
                    style: AppTextStyle.headline1,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ProfileInfoWidget(
                  label: 'Nama',
                  content: '${state.user.firstName} ${state.user.lastName}',
                ),
                const SizedBox(
                  height: 16,
                ),
                ProfileInfoWidget(
                  label: 'Email',
                  content: state.user.email,
                ),
                const SizedBox(
                  height: 16,
                ),
                ProfileInfoWidget(
                  label: 'Gender',
                  content: state.user.gender,
                ),
                const SizedBox(
                  height: 24,
                ),
                PrimaryButton(
                  text: 'Log Out',
                  onTap: () {
                    context.go(LoginPage.route);
                  },
                )
              ],
            );
          }
          return Skeletonizer(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '@ristekoss',
                    style: AppTextStyle.headline1,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const ProfileInfoWidget(
                    label: 'Nama', content: 'Ristek Open Source'),
                const SizedBox(
                  height: 16,
                ),
                const ProfileInfoWidget(
                    label: 'Email', content: 'open-source@ristek.cs.ui.ac.id'),
                const SizedBox(
                  height: 16,
                ),
                const ProfileInfoWidget(label: 'Address', content: 'Fasilkom UI'),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:cinnamon_riverpod_2/features/profile/controller/profile_state.dart';
import 'package:cinnamon_riverpod_2/infra/auth/service/auth_service.dart';
import 'package:cinnamon_riverpod_2/infra/auth/service/firebase_auth_service.dart';
import 'package:cinnamon_riverpod_2/infra/planner/repository/trip_repository.dart';
import 'package:cinnamon_riverpod_2/infra/traveler/repository/traveler_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeNotifierProvider<ProfileController, ProfileState>
    profileControllerProvider =
    NotifierProvider.autoDispose<ProfileController, ProfileState>(
  () => ProfileController(),
);

class ProfileController extends AutoDisposeNotifier<ProfileState> {
  FirebaseAuthService get _authService => ref.read(authServiceProvider);

  TravelerRepository get _travelerRepo => ref.read(travelerRepositoryProvider);

  TripRepository get _tripRepo => ref.read(tripRepositoryProvider);

  Future<void> toggleNotifications(bool flag) async {
    await _travelerRepo.updatePushNotificationsFlag(flag);
    state = ProfileState(notificationsFlag: flag);
  }

  Future<void> deleteUserAccount() async {
    state = const ProfileState(loading: true);

    try {
      await _authService.deleteAccount().then((_) => _travelerRepo
          .deleteProfile()
          .then((_) => _tripRepo.removeUserTrips()));
    } catch (e) {
      state = const ProfileState(loading: false);
      rethrow;
    }
    state = const ProfileState(loading: false);
  }

  Future<bool> logOut() async {
    state = const ProfileState(loading: true);

    await _authService.logout();

    state = const ProfileState(loading: false);
    return _authService.auth.currentUser == null;
  }

  @override
  ProfileState build() {
    return ProfileState(
        notificationsFlag:
            ref.watch(profileDataProvider).value?.sendPushNotifications ??
                false);
  }
}

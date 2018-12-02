import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

import '../../actions/actions.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import './standardButton.dart';
import '../../lib/showNotification.dart';
import '../../utils/achivementsUtil.dart';
import '../../achivements/achivements.dart';
import '../../store.dart';

ShowNotification notification = ShowNotification();

class ButtonContainer extends StatefulWidget {

  @override
  _ButtonContainer createState() => _ButtonContainer();
}

class _ButtonContainer extends State<ButtonContainer> {
  final Set<String> achivements = Set.from(['1.3','1.1']);
  bool isClicksCompleted = false;
  bool isSwipesUpCompleted = false;
  bool isSwipesDownCompleted = false;
  bool isSwipesLeftCompleted = false;
  bool isSwipesRightCompleted = false;
  static AudioCache player = new AudioCache();
  final String audioFile = 'clickSound.mp3';

  @override
  void initState() {
    super.initState();
    String challengeKey = AppStore.state.challengeKey;
    print(challengeKey);
    setCompletedChecks(challengeKey);
    player.load(audioFile);
  }

  void setCompletedChecks(String challengeKey) {
    Map<String, bool> availableActions = getAvailableActions(challengeKey);
    isClicksCompleted = !availableActions['clicks'];
    isSwipesUpCompleted = !availableActions['swipesUp'];
    isSwipesDownCompleted = !availableActions['swipesDown'];
    isSwipesLeftCompleted = !availableActions['swipesLeft'];
    isSwipesRightCompleted = !availableActions['swipesRight'];
  }
  /*
   * runs on each interaction with the button
   * should reset store and change challenge if all
   * conditions are true
  */
  void checkChallengeCompletion(_ViewModel vm) {
    if (this.isClicksCompleted && this.isSwipesUpCompleted &&
        this.isSwipesDownCompleted &&
        this.isSwipesLeftCompleted &&
        this.isSwipesRightCompleted) {

      vm.resetClickCount();
      vm.resetSwipeUpCount();
      vm.resetSwipeDownCount();
      vm.resetSwipeLeftCount();
      vm.resetSwipeRightCount();
      onAchivement(vm, getChallengeAchivement(vm.challengeKey));
      String challengeKey = getNextChallengeKey(vm.challengeKey);
      vm.setChallengeKey(challengeKey);
      setCompletedChecks(challengeKey);
    }
  }

  void onAchivement(_ViewModel vm String achivement) {
    if (achivement != '') {
      Achivement _achivement = getAchivement(achivement);
      notification.addToQueue(
        title: _achivement.title,
        body: _achivement.body,
        context: context
      );
      vm.addAchivements(achivement);
    }
  }

  void onPressed(_ViewModel vm, [playClickSound = false]) {
    vm.addClick(1);

    if(playClickSound)_playClickSound(vm);

    String achivement = getClickAchivement(vm.challengeKey, vm.clickCount + 1);
    onAchivement(vm, achivement);

    if (isClicksCompleted == false && isClicksComplete(vm.challengeKey, vm.clickCount + 1)) {
      this.isClicksCompleted = true;
    }

    checkChallengeCompletion(vm);
  }

  void _playClickSound(_ViewModel vm) {
    if(!vm.soundEffectMuted){
      player.play(audioFile,volume: getRandomVolume());
    }
  }

  double getRandomVolume(){
    Random random = Random();
    // return double from 0.5 to 1
    return (random.nextInt(10-4)+5)/10;
  }

  void onSwipeAny(vm) {

  }

  void onSwipeUp(_ViewModel vm) {
    vm.addSwipeUp(1);
    String achivement = getSwipeUpAchivement(vm.challengeKey, vm.swipeUpCount + 1);
    onAchivement(vm, achivement);

    if (isSwipesUpCompleted == false && isSwipesUpComplete(vm.challengeKey, vm.swipeUpCount + 1)) {
      this.isSwipesUpCompleted = true;
    }

    checkChallengeCompletion(vm);
  }

  void onSwipeDown(_ViewModel vm) {
    vm.addSwipeDown(1);
    String achivement = getSwipeDownAchivement(vm.challengeKey, vm.swipeDownCount + 1);
    onAchivement(vm, achivement);

    if (isSwipesDownCompleted == false && isSwipesDownComplete(vm.challengeKey, vm.swipeDownCount + 1)) {
      this.isSwipesDownCompleted = true;
    }

    checkChallengeCompletion(vm);
  }

  void onSwipeLeft(_ViewModel vm) {
    vm.addSwipeLeft(1);
    String achivement = getSwipeLeftAchivement(vm.challengeKey, vm.swipeLeftCount + 1);
    onAchivement(vm, achivement);

    if (isSwipesLeftCompleted == false && isSwipesLeftComplete(vm.challengeKey, vm.swipeLeftCount + 1)) {
      this.isSwipesLeftCompleted = true;
    }

    checkChallengeCompletion(vm);
  }

  void onSwipeRight(_ViewModel vm) {
    vm.addSwipeRight(1);
    String achivement = getSwipeDownAchivement(vm.challengeKey, vm.swipeRightCount + 1);
    onAchivement(vm, achivement);

    if (isSwipesRightCompleted == false && isSwipesRightComplete(vm.challengeKey, vm.swipeRightCount + 1)) {
      this.isSwipesRightCompleted = true;
    }

    checkChallengeCompletion(vm);
  }

  Widget withSwipeDetection(_ViewModel vm, Widget child) {
    return SwipeDetector(
      child: child,
      onSwipeUp: () {
        print('swipe up');
        print(vm.swipeUpCount);
        onSwipeAny(vm);
        onSwipeUp(vm);
      },
      onSwipeDown: () {
        print('swipe down');
        print(vm.swipeDownCount);
        onSwipeAny(vm);
        onSwipeDown(vm);
      },
      onSwipeLeft: () {
        print('swipe left');
        print(vm.swipeLeftCount);
        onSwipeAny(vm);
        onSwipeLeft(vm);
      },
      onSwipeRight: () {
        print('swipe right');
        print(vm.swipeRightCount);
        onSwipeAny(vm);
        onSwipeRight(vm);
      },
    );
  }

  Widget getButtonWidget(_ViewModel vm) {
    String latestAchivement =
        getLatestAchivement(vm.completeAchivements, achivements);
    switch (latestAchivement) {
      case '1.1':
        return StandardButton(
          text: 'Hey <3',
          textStyle: TextStyle(fontSize: 20, color: Colors.red),
          onPressed: () => this.onPressed(vm));
      case '1.3':
      return StandardButton(
          text: 'Hey <3',
          textStyle: TextStyle(fontSize: 20, color: Colors.red),
          onPressed: () => this.onPressed(vm, true));
      default:
        return StandardButton(
            text: 'Button', onPressed: () => this.onPressed(vm));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, _ViewModel vm) => withSwipeDetection(vm, getButtonWidget(vm)));
  }
}

class _ViewModel {
  final Function(int n) addClick;
  final Function(String key) addAchivements;
  final Function() resetClickCount;
  final Function(String key) setChallengeKey;
  final String challengeKey;
  final int clickCount;
  final Set<String> completeAchivements;
  final Function(int n) addSwipeUp;
  final Function() resetSwipeUpCount;
  final Function(int n) addSwipeDown;
  final Function() resetSwipeDownCount;
  final Function(int n) addSwipeLeft;
  final Function() resetSwipeLeftCount;
  final Function(int n) addSwipeRight;
  final Function() resetSwipeRightCount;
  final int swipeUpCount;
  final int swipeDownCount;
  final int swipeLeftCount;
  final int swipeRightCount;
  final bool soundEffectMuted;

  _ViewModel(
    this.addClick,
    this.addAchivements,
    this.resetClickCount,
    this.setChallengeKey,
    this.addSwipeUp,
    this.addSwipeDown,
    this.addSwipeLeft,
    this.addSwipeRight,
    this.resetSwipeUpCount,
    this.resetSwipeDownCount,
    this.resetSwipeLeftCount,
    this.resetSwipeRightCount,
    this.challengeKey,
    this.clickCount,
    this.completeAchivements,
    this.swipeUpCount,
    this.swipeDownCount,
    this.swipeLeftCount,
    this.swipeRightCount,
    this.soundEffectMuted
  );

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel((int n) {
      store.dispatch(ClickAction(n));
    }, (String key) {
      store.dispatch(AddAchivementAction(key));
    }, () {
      store.dispatch(ClickCount.ResetClickCount);
    }, (String key) {
      store.dispatch(SetChallengeKey(key));
    }, (int n) {
      store.dispatch(SwipeUpAddAction(n));
    }, (int n) {
      store.dispatch(SwipeDownAddAction(n));
    }, (int n) {
      store.dispatch(SwipeLeftAddAction(n));
    }, (int n) {
      store.dispatch(SwipeRightAddAction(n));
    },
    () {
      store.dispatch(SwipeCount.ResetUpCount);
    },
    () {
      store.dispatch(SwipeCount.ResetDownCount);
    },
    () {
      store.dispatch(SwipeCount.ResetLeftCount);
    },
    () {
      store.dispatch(SwipeCount.ResetRightCount);
    },
    store.state.challengeKey,
    store.state.clickCount,
    store.state.completeAchivements,
    store.state.swipeUpCount,
    store.state.swipeDownCount,
    store.state.swipeLeftCount,
    store.state.swipeRightCount,
    store.state.soundEffectMuted
    );
  }
}

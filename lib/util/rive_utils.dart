import "package:rive/rive.dart";
// class RiveUtils {
//   StateMachineController getRiveController(
//       Artboard artboard,
//       { StateMachineName = "State Machine 1" })
//   {
//     StateMachineController? controller = StateMachineController.fromArtboard(artboard,StateMachineName);
//     artboard.addController(controller!);
//     return controller;
//   }
// }
class RiveUtils {
  StateMachineController getRiveController(
      Artboard artboard,
      {String StateMachineName = "State Machine 1"}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
        artboard, StateMachineName);
    artboard.addController(controller!);
    return controller;
  }
}
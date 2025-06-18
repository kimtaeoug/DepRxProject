class ErrorDialogContents {
  final String contents;
  final String rightBtn;
  final String? leftBtn;
  final bool isOneButton;

  ErrorDialogContents(
      {required this.contents,
      required this.rightBtn,
      this.leftBtn,
      this.isOneButton = true});
}

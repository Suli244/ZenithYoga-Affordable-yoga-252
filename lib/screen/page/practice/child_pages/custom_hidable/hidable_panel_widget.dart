import 'package:affordable_yoga_252/screen/page/practice/child_pages/custom_hidable/widget/multi_value_listenable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HidablePanelWidget extends StatefulWidget {
  const HidablePanelWidget({
    Key? key,
    required this.child,
    this.showButtonAlways = false,
    required this.buttonWidget,
    this.height = 65,
    this.isBottom = false,
  }) : super(key: key);

  final Widget child;
  final bool showButtonAlways;
  final Widget buttonWidget;
  final double height;
  final bool isBottom;

  @override
  State<HidablePanelWidget> createState() => _HidablePanelWidgetState();
}

class _HidablePanelWidgetState extends State<HidablePanelWidget> {
  late final isButtonVisible =
      ValueNotifier<bool>(widget.showButtonAlways ? true : false);
  late final isButtonVisible2 =
      ValueNotifier<bool>(widget.showButtonAlways ? true : false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!widget.showButtonAlways)
          NotificationListener<UserScrollNotification>(
            onNotification: (notif) {
              if (notif.direction == ScrollDirection.forward) {
                show();
              } else if (notif.direction == ScrollDirection.reverse) {
                hide();
              }

              return true;
            },
            child: widget.child,
          ),
        if (widget.showButtonAlways) widget.child,
        MultiValueListenable(
          first: isButtonVisible,
          second: isButtonVisible2,
          doubleBuilder: (context, _, __) => Positioned(
            bottom: widget.isBottom
                ? 0
                : isButtonVisible.value
                    ? 30
                    : 0,
            // left: 16,
            right: 16,
            child: AnimatedContainer(
              padding: EdgeInsets.only(
                bottom: widget.isBottom
                    ? 0
                    : isButtonVisible.value
                        ? 16
                        : 0,
              ),
              duration: const Duration(milliseconds: 80),
              alignment: Alignment.topLeft,
              height: isButtonVisible2.value ? widget.height : 0,
              child: widget.buttonWidget,
            ),
          ),
        ),
      ],
    );
  }

  hide() async {
    isButtonVisible.value = false;

    await Future.delayed(const Duration(milliseconds: 80));

    isButtonVisible2.value = false;
  }

  show() async {
    isButtonVisible2.value = true;

    await Future.delayed(const Duration(milliseconds: 50));

    isButtonVisible.value = true;
  }

  @override
  void dispose() {
    isButtonVisible.dispose();
    isButtonVisible2.dispose();
    super.dispose();
  }
}

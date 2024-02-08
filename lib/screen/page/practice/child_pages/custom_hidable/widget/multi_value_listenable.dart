import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiValueListenable<A, B, C, D> extends StatelessWidget {
  const MultiValueListenable({
    Key? key,
    required this.first,
    required this.second,
    this.third,
    this.fourth,
    this.tripleBuilder,
    this.doubleBuilder,
    this.quadrupleBuilder,
  }) : super(key: key);

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final ValueListenable<C>? third;
  final ValueListenable<D>? fourth;
  final Widget Function(
    BuildContext context,
    A a,
    B b,
  )? doubleBuilder;
  final Widget Function(
    BuildContext context,
    A a,
    B b,
    C? c,
  )? tripleBuilder;
  final Widget Function(
    BuildContext context,
    A a,
    B b,
    C? c,
    D? d,
  )? quadrupleBuilder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (_, b, __) {
            if (third != null && fourth == null) {
              return ValueListenableBuilder<C>(
                valueListenable: third!,
                builder: (context, c, __) {
                  return tripleBuilder!(context, a, b, c);
                },
              );
            }
            if (fourth != null) {
              return ValueListenableBuilder<C>(
                valueListenable: third!,
                builder: (context, c, __) {
                  return ValueListenableBuilder<D>(
                    valueListenable: fourth!,
                    builder: (context, d, __) {
                      return quadrupleBuilder!(context, a, b, c, d);
                    },
                  );
                },
              );
            } else {
              return doubleBuilder!(context, a, b);
            }
          },
        );
      },
    );
  }
}

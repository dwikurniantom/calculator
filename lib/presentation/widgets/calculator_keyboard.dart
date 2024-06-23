import 'package:smath/common/consts/component_key.dart';
import 'package:smath/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../bloc/calculator/calculator_cubit.dart';
import 'calculator_button.dart';

class CalculatorKeyboard extends StatelessWidget {
  const CalculatorKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonPercent,
            ),
            color: context.colorScheme.secondaryContainer,
            child: Text(
              '%',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
            onTap: () {
              context.read<CalculatorCubit>().percent();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonMultiply,
            ),
            color: context.colorScheme.secondaryContainer,
            child: Text(
              '×',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
            onTap: () {
              context.read<CalculatorCubit>().multiply();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonDivide,
            ),
            color: context.colorScheme.secondaryContainer,
            child: Text(
              '÷',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
            onTap: () {
              context.read<CalculatorCubit>().divide();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonBackspace,
            ),
            color: context.colorScheme.secondaryContainer,
            child: Icon(
              Icons.backspace,
              color: context.colorScheme.onSecondaryContainer,
            ),
            onTap: () {
              context.read<CalculatorCubit>().remove();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonSeven,
            ),
            child: Text(
              '7',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(7);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonEight,
            ),
            child: Text(
              '8',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(8);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonNine,
            ),
            child: Text(
              '9',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(9);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonSubtract,
            ),
            color: context.colorScheme.secondaryContainer,
            child: Text(
              '-',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().substract();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonFour,
            ),
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(4);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonFive,
            ),
            child: Text(
              '5',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(5);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonSix,
            ),
            child: Text(
              '6',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(6);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonAdd,
            ),
            color: context.colorScheme.secondaryContainer,
            child: Text(
              '+',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().addition();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonOne,
            ),
            child: Text(
              '1',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(1);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonTwo,
            ),
            child: Text(
              '2',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(2);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonThree,
            ),
            child: Text(
              '3',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(3);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonEqual,
            ),
            color: context.colorScheme.tertiaryContainer,
            child: Text(
              '=',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onTertiaryContainer,
              ),
            ),
            onTap: () {
              context.read<CalculatorCubit>().calculate(
                    isFinished: true,
                  );
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonClear,
            ),
            child: Text(
              'AC',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().clearAll();
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonZero,
            ),
            child: Text(
              '0',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().add(0);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: CalculatorButton(
            key: const Key(
              ComponentKey.buttonDot,
            ),
            child: Text(
              '.',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
            onTap: () {
              context.read<CalculatorCubit>().comma();
            },
          ),
        ),
      ],
    );
  }
}

import 'package:calculator/common/extensions/context_extension.dart';
import 'package:calculator/presentation/bloc/calculator/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/calculator_button.dart';

class CalculatorPage extends StatelessWidget {
  /// Route name for CalculatorPage in app routes, to be used in [Navigator]
  /// ```dart
  /// Navigator.pushNamed(
  ///   context,
  ///   CalculatorPage.routeName,
  /// );
  /// ```
  static const String routeName = '/calculator';

  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc Provider for calculator cubit
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<CalculatorCubit, String?>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state ?? '0',
                            textAlign: TextAlign.end,
                            style: context.textTheme.displayLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
                            child: Text(
                              '%',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
                            child: Text(
                              '×',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
                            child: Text(
                              '+',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
                            child: const Icon(
                              Icons.backspace,
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
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
                            color: context.colorScheme.secondaryContainer,
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
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
                            color: context.colorScheme.secondaryContainer,
                            child: Text(
                              '+',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
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
                            color: context.colorScheme.secondaryContainer,
                            child: Text(
                              '=',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: context.colorScheme.onSecondaryContainer,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
                            child: Text(
                              'AC',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {
                              context.read<CalculatorCubit>().clear();
                            },
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalculatorButton(
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
                            child: Text(
                              '.',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineSmall,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

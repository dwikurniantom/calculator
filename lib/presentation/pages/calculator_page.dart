import 'package:calculator/common/extensions/context_extension.dart';
import 'package:calculator/presentation/bloc/calculator/calculator_cubit.dart';
import 'package:calculator/presentation/bloc/calculator/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../common/formatters/thousands_separator_input_formatter.dart';
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

  CalculatorPage({super.key});

  /// Text field controller
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Bloc Provider for calculator cubit
    return BlocProvider(
      create: (context) => CalculatorCubit(
        inputController,
      ),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<CalculatorCubit, CalculatorState?>(
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: TextFormField(
                                autofocus: true,
                                readOnly: true,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style:
                                    context.textTheme.displayMedium?.copyWith(
                                  color: (state?.isIdle ?? false)
                                      ? context.colorScheme.primary
                                      : context.colorScheme.onBackground,
                                ),
                                controller: inputController,
                                inputFormatters: [
                                  /// Deny comma (we dont need comma)
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r','),
                                  ),
                                  ThousandsSeparatorInputFormatter(),
                                ],
                                textAlign: TextAlign.end,
                                decoration: const InputDecoration(
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 0,
                                    minHeight: 0,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: state?.finalResult != null &&
                                state?.finalResult != '0',
                            child: Text(
                              state?.finalResult ?? '0',
                              textAlign: TextAlign.end,
                              style: context.textTheme.displayMedium,
                            ),
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
                            color: context.colorScheme.secondaryContainer,
                            child: Text(
                              '%',
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
                            onTap: () {
                              context.read<CalculatorCubit>().substract();
                            },
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
                            onTap: () {
                              context.read<CalculatorCubit>().addition();
                            },
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
                            onTap: () {
                              context.read<CalculatorCubit>().comma();
                            },
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

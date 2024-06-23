import 'package:smath/common/extensions/context_extension.dart';
import 'package:smath/presentation/bloc/calculator/calculator_state.dart';
import 'package:smath/presentation/bloc/global/global_cubit.dart';
import 'package:smath/presentation/bloc/global/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorUpperSection extends StatelessWidget {
  final ScrollController inputScrollController;
  final TextEditingController inputController;
  final CalculatorState? state;

  const CalculatorUpperSection({
    super.key,
    required this.inputScrollController,
    required this.inputController,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: inputScrollController,
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: inputController,
                builder: (context, value, child) => TextFormField(
                  showCursor: true,
                  autofocus: true,
                  readOnly: true,
                  maxLines: null,
                  onChanged: (value) {
                    /// Every textform field change, scroll to bottom because
                    /// by default the TextFormField doesnt automaticaly scroll
                    /// to the bottom. And thats will make the cursor not visible
                    inputScrollController.jumpTo(
                      inputScrollController.position.maxScrollExtent,
                    );
                  },
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.multiline,

                  /// The color styling is depend on the state. Whenever the
                  /// calculation proccess is done and marked as idle then it
                  /// will paint the result with primary color.
                  style: context.textTheme.displayMedium?.copyWith(
                    color: (state?.isIdle ?? false)
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurface,

                    /// This is also dynamic fontsize, based on the length of
                    /// the text. This hacky stuff is added to avoid big bulky
                    /// text whenever the fields is full of text
                    fontSize:
                        (context.textTheme.displayMedium?.fontSize ?? 0.0) -
                            (value.text.length / 7.5),
                  ),
                  controller: inputController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                      RegExp(r','),
                    ),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// This button is used to switch between light and dark mode
              IconButton(
                onPressed: () {
                  /// By using GlobalBloc we can change the theme mode
                  context.read<GlobalBloc>().switchBrightness();
                },

                /// Also it has nice feature to switch the icon based on the
                /// brightness / theme mode
                icon: BlocBuilder<GlobalBloc, GlobalState>(
                  builder: (context, state) => Visibility(
                    visible: state.isLightMode,
                    replacement: const Icon(Icons.light_mode),
                    child: const Icon(Icons.dark_mode),
                  ),
                ),
              ),

              /// This is result label for displaying the final result
              Expanded(
                child: Visibility(
                  /// If the final result arent null and not 0 then it will be
                  /// displayed
                  visible:
                      state?.finalResult != null && state?.finalResult != '0',
                  child: Text(
                    state?.finalResult ?? '0',
                    textAlign: TextAlign.end,
                    style: context.textTheme.displaySmall?.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(0.65),

                      /// Final result label also have dynamic fontsize, to avoid
                      /// the big bulky text. By substracting the displaySmall
                      /// font size with finalResultLength / 15
                      fontSize:
                          (context.textTheme.displaySmall?.fontSize ?? 0.0) -
                              (state?.finalResult?.length ?? 0 / 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

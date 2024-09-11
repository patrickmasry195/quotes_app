import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc/quotes_bloc.dart';
import 'package:quotes_app/widgets/custom_button.dart';
import 'package:quotes_app/widgets/custom_quote_card.dart';
import 'package:quotes_app/widgets/my_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuotesView extends StatefulWidget {
  const QuotesView({super.key});

  @override
  State<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Row(
              children: [
                Image.asset(
                  'assets/quotes_logo.png',
                  height: 60,
                  width: 60,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: BlocBuilder<QuotesBloc, QuotesState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return Skeletonizer(
                    effect: const ShimmerEffect(
                      baseColor: Color(0xffA0A0A0),
                      highlightColor: Color(0xffF5F5F5),
                    ),
                    textBoneBorderRadius:
                        TextBoneBorderRadius(BorderRadius.circular(3)),
                    child: const CustomQuoteCard(
                      quote:
                          'Lack of emotion causes lack of progress and lack of motivation.',
                      author: 'Tony Robbins',
                      color: Color(0xff222a68),
                    ),
                  );
                } else if (state is LoadedState) {
                  return CustomQuoteCard(
                    quote: state.quote.single.quote,
                    author: state.quote.single.author,
                    color: state.color,
                  );
                } else if (state is ErrorState) {
                  return const MyErrorWidget(message: 'Try Again latter .');
                }
                return const SizedBox();
              }),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onTap: () {
              context.read<QuotesBloc>().add(GetQuoteEvent());
            },
            buttonName: 'Inspire me',
            height: 53,
            width: 145,
          ),
        ],
      ),
    );
  }
}

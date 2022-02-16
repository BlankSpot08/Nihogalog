import 'package:flutter/material.dart';
import 'package:frontend/models/historyWord.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:frontend/view_models/history_view_model.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.historyWord,
      required this.onTap,
      required this.isSelected,
      required this.favoritable,
      required this.viewModel})
      : super(key: key);

  final Function onTap;
  final HistoryWord historyWord;
  final HistoryViewModel viewModel;
  final bool isSelected;
  final bool favoritable;

  @override
  Widget build(BuildContext context) {
    final editStatus = viewModel.getEditStatus;

    return ListTile(
      onTap: () => onTap(),
      tileColor: HexColor('#858585'),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            editStatus
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 23,
                      color: isSelected
                          ? HexColor('#ffbc00')
                          : HexColor('#c6c6c6'),
                    ),
                  )
                : const Text(''),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        historyWord.getOriginalWord,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
                      Text(
                        historyWord.getTranslationWord,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  favoritable
                      ? Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: editStatus
                                ? null
                                : IconButton(
                                    onPressed: () =>
                                        Provider.of<HistoryViewModel>(context,
                                                listen: false)
                                            .toggleFavorite(historyWord),
                                    icon: const Icon(Icons.star_rounded),
                                    splashRadius: 15,
                                    iconSize: 30,
                                    color: historyWord.getFavorite ?? false
                                        ? HexColor('#ffbc00')
                                        : HexColor('#CECECE'),
                                    splashColor: Colors.transparent,
                                  ),
                          ),
                        )
                      : const Text("")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

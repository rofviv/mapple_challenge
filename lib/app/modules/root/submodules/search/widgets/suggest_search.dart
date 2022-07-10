import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/shared.dart';
import '../bloc/search_bloc.dart';

class SuggestSearch extends StatelessWidget {
  final String title;
  final List<String> list;
  final Function()? onDelete;
  const SuggestSearch({
    Key? key,
    required this.title,
    required this.list,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchBloc searchBloc = Modular.get();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (onDelete != null)
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        ...list.map(
          (e) => _ItemSuggest(
            title: e,
            onPress: () {
              searchBloc.add(OnChangeQuery(e));
              searchBloc.searchTextCtrl.text = e;
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ItemSuggest extends StatelessWidget {
  final String title;
  final Function()? onPress;
  const _ItemSuggest({
    Key? key,
    required this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}

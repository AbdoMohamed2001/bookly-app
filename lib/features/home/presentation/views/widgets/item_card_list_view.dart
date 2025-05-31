import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/components/item_card.dart';

class ItemCardListView extends StatefulWidget {
  final List<BookEntity> books;
  const ItemCardListView({super.key, required this.books});

  @override
  State<ItemCardListView> createState() => _ItemCardListViewState();
}

class _ItemCardListViewState extends State<ItemCardListView> {
  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  scrollListener() {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {}
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (_, i) => ItemCard(
          imageUrl: widget.books[i].imageUrl!,
        ),
        separatorBuilder: (_, i) => SizedBox(
          width: 15,
        ),
      ),
    );
  }
}

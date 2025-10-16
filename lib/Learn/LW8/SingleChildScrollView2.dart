import 'package:flutter/material.dart';


class ScrollviewDemo2 extends StatefulWidget {
  const ScrollviewDemo2({super.key});


  @override
  State<ScrollviewDemo2> createState() => _ScrollviewDemo2State();
}


class _ScrollviewDemo2State extends State<ScrollviewDemo2> {
  // Create a ScrollController instance
  final ScrollController _scrollController = ScrollController();


  // Method to scroll to the top (position 0.0)
  void _scrollToTop() {
    if (_scrollController.hasClients) {
      // _scrollController.jumpTo(0.0);
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
      );
    }
  }


  // Method to scroll to the bottom (maxScrollExtent)
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
      );
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollView Demo',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        controller: _scrollController,
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dignissim suspendisse in est ante in nibh mauris cursus mattis. Tincidunt vitae semper quis lectus nulla at volutpat. Netus et malesuada fames ac. In dictum non consectetur a erat nam at lectus. A scelerisque purus semper eget duis at tellus at urna. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper. Pretium lectus quam id leo in vitae turpis massa sed. Elementum facilisis leo vel fringilla est ullamcorper eget nulla facilisi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Nibh praesent tristique magna sit amet purus gravida quis blandit. Volutpat lacus laoreet non curabitur gravida arcu ac. Eu sem integer vitae justo eget magna fermentum. Tortor at risus viverra adipiscing at in tellus integer feugiat. Non sodales neque sodales ut etiam sit amet nisl. Cras fermentum odio eu feugiat pretium. Blandit massa enim nec dui nunc mattis enim ut tellus. Sagittis vitae et leo duis. Adipiscing commodo elit at imperdiet dui accumsan sit amet.',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.justify,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Scroll to Top FAB
          FloatingActionButton(
            // heroTag is used to identify the FAB when we have multiple FABs
            heroTag: 'topBtn',
            onPressed: _scrollToTop,
            backgroundColor: Colors.green,
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          // Scroll to Bottom FAB
          FloatingActionButton(
            heroTag: 'bottomBtn',
            onPressed: _scrollToBottom,
            backgroundColor: Colors.red,
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }
}

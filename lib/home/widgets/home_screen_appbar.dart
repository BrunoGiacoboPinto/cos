import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:flutter/material.dart';

final class HomeScreenAppbar extends StatefulWidget {
  const HomeScreenAppbar({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  State<HomeScreenAppbar> createState() => _HomeScreenAppbarState();
}

class _HomeScreenAppbarState extends State<HomeScreenAppbar> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();
    widget.viewModel.addListener(_onValidVNI);
    _textController.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.removeListener(_onFocusChange);
    _textController.dispose();
    widget.viewModel.removeListener(_onValidVNI);
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && _textController.text.isEmpty) {
      _focusNode.unfocus();
    }
  }

  void _onValidVNI() {
    if (widget.viewModel.state is HomeScreenVNIValid || widget.viewModel.state is HomeScreenInitial) {
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return TextField(
          focusNode: _focusNode,
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Enter the VIN of the vehicle you are looking for',
            border: const OutlineInputBorder(),
            suffixIcon: Icon(Icons.search, color: orange),
            errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: orange,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            errorText: switch (widget.viewModel.state) {
              HomeScreenVNIError(error: final error) => error,
              _ => null,
            },
          ),
          keyboardType: TextInputType.text,
          onChanged: widget.viewModel.onVniChanged,
          maxLength: 17,
          onTapOutside: (event) => _focusNode.unfocus(),
          onTapUpOutside: (event) => _focusNode.unfocus(),
        );
      },
    );
  }
}

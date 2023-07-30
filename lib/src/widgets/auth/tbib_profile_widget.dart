import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/gen/assets.gen.dart';

/// profile page
class TBIBProfileWidget extends StatefulWidget {
  /// constructor
  const TBIBProfileWidget({
    this.imagePath,
    this.onEdit,
    this.hideEditButton = false,
    super.key,
  });

  /// image path
  final String? imagePath;

  /// hide edit button
  final bool hideEditButton;

  /// get value is edit
  final void Function({required bool isEdit})? onEdit;

  @override
  State<TBIBProfileWidget> createState() => _TBIBProfileWidgetState();
}

class _TBIBProfileWidgetState extends State<TBIBProfileWidget> {
  // bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _BuildProfileImage(widget.imagePath),
          Positioned(
            bottom: 0,
            right: 4,
            child: _BuildEditIcon(widget.onEdit),
          ),
        ],
      ),
    );
  }
}

class _BuildProfileImage extends StatefulWidget {
  const _BuildProfileImage(this.imagePath);
  final String? imagePath;
  @override
  State<_BuildProfileImage> createState() => _BuildProfileImageState();
}

class _BuildProfileImageState extends State<_BuildProfileImage> {
  bool isImageFromNetwork = false;
  bool isFile = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.imagePath?.contains('http') ?? false) {
      isImageFromNetwork = true;
    } else if (widget.imagePath?.contains('file') ?? false) {
      isFile = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: ClipOval(
        child: widget.imagePath == null
            ? const $AssetsSvgGen().avatar.svg(
                  fit: BoxFit.cover,
                  width: 128,
                  height: 128,
                  package: 'tbib_flutter_simple_ui',
                )
            : isImageFromNetwork
                ? CachedNetworkImage(
                    imageUrl: widget.imagePath!,
                    fit: BoxFit.cover,
                    width: 128,
                    height: 128,
                  )
                : isFile
                    ? Image.file(
                        File(widget.imagePath!),
                        fit: BoxFit.cover,
                        width: 128,
                        height: 128,
                      )
                    : Container(),
      ),
    );
  }
}

// Widget buildImage() {
//   final image = NetworkImage(imagePath);

//   return ClipOval(
//     child: Material(
//       color: Colors.transparent,
//       child: Ink.image(
//         image: image,
//         fit: BoxFit.cover,
//         width: 128,
//         height: 128,
//         child: InkWell(onTap: onClicked),
//       ),
//     ),
//   );
// }

class _BuildEditIcon extends StatefulWidget {
  const _BuildEditIcon(this.onEdit);

  final void Function({required bool isEdit})? onEdit;

  @override
  State<_BuildEditIcon> createState() => __BuildEditIconState();
}

class __BuildEditIconState extends State<_BuildEditIcon> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.primary,
          child: ClipOval(
            child: Container(
              padding: const EdgeInsets.all(3),
              color: Colors.white,
              child: Icon(
                isEdit ? Icons.close : Icons.edit,
                color: isEdit
                    ? Colors.red.shade900
                    : Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          isEdit = !isEdit;
          widget.onEdit?.call(isEdit: !isEdit);
        });
      },
    );
  }
}

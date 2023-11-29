import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tbib_file_uploader/tbib_file_uploader.dart';
import 'package:tbib_flutter_simple_ui/gen/assets.gen.dart';

/// profile page
class TBIBProfileWidget extends StatefulWidget {
  /// constructor
  const TBIBProfileWidget({
    this.imagePath,
    this.onEdit,
    this.hideEditButton = false,
    super.key,
    this.isEdit = false,
  });

  /// image path
  final String? imagePath;

  /// hide edit button
  final bool hideEditButton;
  final bool isEdit;

  /// get value is edit
  final void Function({required bool isEdit})? onEdit;

  @override
  State<TBIBProfileWidget> createState() => _TBIBProfileWidgetState();
}

class _TBIBProfileWidgetState extends State<TBIBProfileWidget> {
  bool isEdit = false;
  bool isImageFromNetwork = false;
  bool isFile = false;

  @override
  void initState() {
    isEdit = widget.isEdit;
    super.initState();
    if (widget.imagePath?.contains('http') ?? false) {
      isImageFromNetwork = true;
    } else if (widget.imagePath?.contains('file') ?? false) {
      isFile = true;
    }

    image = widget.imagePath;
  }

  String? image;
  @override
  Widget build(BuildContext context) {
    // get bool isEdit from onE
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: !isEdit
                ? null
                : () {
                    onTapSelectImage(context);
                  },
            child: ClipOval(
              child: image == null
                  ? const $AssetsSvgGen().avatar.svg(
                        fit: BoxFit.cover,
                        width: 128,
                        height: 128,
                        package: 'tbib_flutter_simple_ui',
                      )
                  : isImageFromNetwork
                      ? CachedNetworkImage(
                          imageUrl: image!,
                          fit: BoxFit.cover,
                          width: 128,
                          height: 128,
                        )
                      : isFile
                          ? Image.file(
                              File(image!),
                              fit: BoxFit.cover,
                              width: 128,
                              height: 128,
                            )
                          : Container(),
            ),
          ),
          if (!widget.hideEditButton || widget.hideEditButton && isEdit)
            Positioned(
              bottom: 0,
              right: 4,
              child: InkWell(
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Theme.of(context).colorScheme.primary,
                    child: ClipOval(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        color: Colors.white,
                        child: Icon(
                          isEdit ? Icons.image : Icons.edit,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (!isEdit) {
                    setState(() {
                      isEdit = true;
                      widget.onEdit?.call(isEdit: true);
                    });
                  } else {
                    onTapSelectImage(context);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> onTapSelectImage(BuildContext context) {
    return selectFileOrImage(
      context: context,
      selectedFile: ({String? path, String? name}) {
        setState(() {
          image = path;
          isImageFromNetwork = false;
          isFile = true;
        });
      },
      selectFile: false,
      selectImageCamera: true,
      selectImageGallery: true,
    );
  }
}

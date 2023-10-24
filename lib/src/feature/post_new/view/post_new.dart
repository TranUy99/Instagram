import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constant/utils/image.dart';
import '../bloc/post_new_bloc.dart';
import '../controller/post_new_controller.dart';
import '../widget/post_new_widget.dart';

class PostNew extends StatefulWidget {
  const PostNew({super.key});

  @override
  State<PostNew> createState() => _PostNewState();
}

class _PostNewState extends State<PostNew> {
  Uint8List? _file;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _descriptionController = TextEditingController();

  selectImage() async {
    Uint8List file = await pickImage(ImageSource.gallery);
    context.read<PostNewBloc>().add(FileEvent(file: file));
    setState(() {
      _file = file;
    });
  }

  camera() async {
    Uint8List file = await pickImage(ImageSource.camera);
    context.read<PostNewBloc>().add(FileEvent(file: file));
    setState(() {
      _file = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Scaffold(
            key: _scaffoldKey,
            appBar: buildAppBarPost(() {
              PostNewController(context: context).postNew();
            }),
            body: Center(
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.upload),
                    onPressed: selectImage,
                    iconSize: 50, // Set the desired icon size
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: camera,
                    iconSize: 50,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            appBar: buildAppBarPost(() {
              PostNewController(context: context).postNew();
            }),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                              image: MemoryImage(_file!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      onChanged: (value) {
                    context.read<PostNewBloc>().add(DescriptionEvent(description: value));
                    
                      },
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        hintText: "Write a caption...",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

part of '../../web_ui_commons.dart';

class FileInputField extends StatefulWidget {
  const FileInputField(
      {super.key, required this.label, this.onFileUploaded, this.previewFile});
  final String? label;
  final Function? onFileUploaded;
  final String? previewFile;

  @override
  State<FileInputField> createState() => _FileInputFieldState();
}

class _FileInputFieldState extends State<FileInputField> {
  bool isUploading = false;
  double uploadProgress = 0.0;
  bool uploadComplete = false;
  bool uploadFailed = false;
  String uploadedImageFile = "";

  @override
  void initState() {
    setState(() {
      if (widget.previewFile != null && widget.previewFile != "") {
        uploadedImageFile = widget.previewFile!;
        //UI display logic
        uploadComplete = true;
        uploadFailed = false;
        isUploading = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.label ?? "Upload File",
          color: AppColors.textLight,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.all(16),
          child: Center(child: fileDisplaySwitch()),
        )
      ],
    );
  }

  Widget fileDisplaySwitch() {
    if (isUploading) {
      return Column(
        children: [
          AppText(
            text: uploadComplete
                ? "Upload Complete!"
                : "Uploading $uploadProgress%... ",
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 16,
          ),
          LinearProgressIndicator(
            //valueColor: AppColors.primary,
            semanticsValue: uploadProgress.toString(),
          )
        ],
      );
    }

    if (uploadComplete == true) {
      return Column(children: [
        Image.network(
          uploadedImageFile,
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 40,
          child: AppButton(
            type: AppButtonStyle.primaryOutline,
            icon: Icons.edit_square,
            label: "Change Photo",
            onPressed: () {
              setState(() {
                isUploading = false;
                uploadFailed = false;
                uploadComplete = false;
              });
            },
          ),
        )
      ]);
    }

    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        AppText(
          text: "Upload image: png/jpg/jpeg",
          color: AppColors.textLight,
        ),
        const SizedBox(
          height: 16,
        ),
        AppButton(
          label: "Choose Photo",
          icon: Icons.photo_library_outlined,
          type: AppButtonStyle.success,
          onPressed: () async {
           // final XFile? image =
                //await ImagePicker().pickImage(source: ImageSource.gallery);
           // uploadFile(image);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        AppButton(
          label: "Use Camera",
          type: AppButtonStyle.successOutline,
          icon: Icons.camera,
          onPressed: () async {
            // final XFile? image =
            //     await ImagePicker().pickImage(source: ImageSource.camera);
            // uploadFile(image);
          },
        ),
      ],
    );
  }

  Future<String> uploadFile(XFile? image) async {
    if (image == null) return "";

    setState(() {
      isUploading = true;
      uploadComplete = false;
      uploadFailed = false;
    });
    //final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    //final compressedImage = await compressImageFile(image: image!);

    final imageFile = File(image!.path);
    //final compressedImage = await Utils.compressFile(imageFile);
    final compressedImage = imageFile;

    String filename = DateTime.now().millisecondsSinceEpoch.toString();

    Reference ref = FirebaseStorage.instanceFor(app: Firebase.app("[AUTH]"))
        .ref()
        .child('ids/$filename.jpg');

    final UploadTask uploadTask = ref.putFile(compressedImage!);
    // await ref.putFile(compressedImage!);

    // Monitor upload progress
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      setState(() {
        uploadProgress =
            ((snapshot.bytesTransferred / snapshot.totalBytes) * 100)
                .roundToDouble(); // Progress as 0-1
      });
    }).onDone(() async {
      await ref.getDownloadURL().then((value) {
        filename = value;

        //preview uploaded file
        setState(() {
          uploadedImageFile = value;
          isUploading = false;
          uploadComplete = true;
        });

        //run event
        widget.onFileUploaded!(value);
      });
    });

    return filename;
  }
}

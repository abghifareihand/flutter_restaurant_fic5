import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/add_product/add_product_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_restaurant_fic5/data/local_datasources/local_datasource.dart';
import 'package:flutter_restaurant_fic5/data/models/request/add_product_request_model.dart';
import 'package:flutter_restaurant_fic5/presentation/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AddRestaurantPage extends StatefulWidget {
  //static const routeName = '/add-restaurant';
  const AddRestaurantPage({super.key});

  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  TextEditingController? _nameController;
  TextEditingController? _descriptionController;
  TextEditingController? _addressController;

  XFile? picture;

  List<XFile>? multiplePicture;

  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  void takeMultiplePicture(List<XFile> files) {
    multiplePicture = files;
    setState(() {});
  }

  @override
  void initState() {
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
  }

  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );

    if (photo != null) {
      picture = photo;
      setState(() {});
    }
  }

  Future<void> getMultipleImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> photo = await picker.pickMultiImage();

    multiplePicture = photo;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Restaurant'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            // picture != null
            //     ? SizedBox(
            //         height: 200,
            //         width: 200,
            //         child: Image.file(File(picture!.path)),
            //       )
            //     : Container(
            //         height: 200,
            //         width: 200,
            //         decoration: BoxDecoration(border: Border.all()),
            //       ),
            // const SizedBox(
            //   height: 8.0,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(),
            //         onPressed: () {},
            //         child: const Text(
            //           'Camera',
            //         )),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(),
            //       onPressed: () {
            //         getImage(ImageSource.gallery);
            //         // getMultipleImage();
            //       },
            //       child: const Text(
            //         "Galery",
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              maxLines: 2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            BlocConsumer<AddProductBloc, AddProductState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error $message'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  },
                  loaded: (data) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Add restaurant ${data.data.attributes.name}'),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );

                    context
                        .read<GetAllProductBloc>()
                        .add(const GetAllProductEvent.getByUserId());
                    context.pop();
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return CustomButton(
                      onPressed: () async {
                        final userId = await LocalDataSource().getuserId();
                        final addProduct = AddProductRequestModel(
                          data: Data(
                            name: _nameController!.text,
                            description: _descriptionController!.text,
                            latitude: '0',
                            longitude: '0',
                            photo: 'https://picsum.photos/200/300',
                            address: _addressController!.text,
                            userId: userId,
                          ),
                        );
                        if (!mounted) return;
                        context
                            .read<AddProductBloc>()
                            .add(AddProductEvent.add(addProduct));
                      },
                      buttonText: 'Add Restaurant',
                      buttonWidth: double.infinity,
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

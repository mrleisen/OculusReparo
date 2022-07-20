
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oculus_reparo/base/utilities/DependencyInjector.dart';
import 'package:oculus_reparo/base/utilities/VisualConstants.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/presentation/charactercreation/CreateCharacterContract.dart';
import 'package:oculus_reparo/presentation/charactercreation/CreateCharacterPresenter.dart';

class CreateCharacterView extends StatefulWidget {

  const CreateCharacterView({Key? key}) : super(key: key);

  @override
  State<CreateCharacterView> createState() => _CreateCharacterViewState();
}

class _CreateCharacterViewState extends State<CreateCharacterView> implements CreateCharacterViewContract {

  bool _isLoading = false;
  bool _showErrorFromApi = false;
  bool _areCharactersSet = false;
  bool _showOnlyCharactersWithPicture = false;
  String _enteredKeyword = "";
  String _errorFromApi = "";
  String? _errorText;
  late  CreateCharacterPresenter _presenter;

  _CreateCharacterViewState(){
    _presenter = CreateCharacterPresenter(serviceLocator());
  }

  @override
  void initState() {
    super.initState();
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {

    const _spaceBetweenSwitchAndScreen = 10.0;

    return Scaffold(
        backgroundColor: Colors.black54,
        extendBodyBehindAppBar: true,

        body: (_isLoading)
            ? const Center(child: CircularProgressIndicator())
            : Stack(
            children: [

              Column(
                  children: [

                    // this is the Character section
                    Expanded(
                        child:SizedBox.shrink()
                    )

                  ]
              ),

              // this is the text input field
              Container(
                  margin: const EdgeInsets.only(
                      top: 80,
                      left: VisualConstants.SPACE_BETWEEN_INPUT_BOXES_AND_SCREEN,
                      right: VisualConstants.SPACE_BETWEEN_INPUT_BOXES_AND_SCREEN),
                  child: TextFormField(
                      cursorColor: Colors.purple,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Search by character name',
                        errorText: _errorText,
                        labelStyle: const TextStyle(color: Colors.white),
                        hintStyle: const TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                      enableSuggestions: true,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (value){  },
                      onChanged: (value){  }
                  )
              )
            ]
        )
    );
  }

  @override
  showLoading() {
    _isLoading = true;
    setState(() { });
  }

  @override
  hideLoading() {
    _isLoading = false;
    setState(() { });
  }

  @override
  showError(String errorMessage) {
    _showErrorFromApi = true;
    _errorFromApi = errorMessage;
    setState(() { });
  }


  // private functions

  @override
  notifyImageSavedSuccessfully() {
    print('Image saved successfully');
    const snackBar = SnackBar(
      content: Text('Image saved successfully'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  notifyImageNotSaved() {
    print('Image not saved');
    const snackBar = SnackBar(
      content: Text('Image not saved'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

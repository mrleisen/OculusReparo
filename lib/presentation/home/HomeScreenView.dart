
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oculus_reparo/base/utilities/DependencyInjector.dart';
import 'package:oculus_reparo/base/utilities/VisualConstants.dart';
import 'package:oculus_reparo/base/widgets/CharacterItem.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/presentation/home/HomeScreenContract.dart';
import 'package:oculus_reparo/presentation/home/HomeScreenPresenter.dart';

class HomeScreenView extends StatefulWidget {

  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> implements HomeScreenContractView, CharacterItemListener {

  bool _isLoading = false;
  bool _showErrorFromApi = false;
  bool _areCharactersSet = false;
  bool _showOnlyCharactersWithPicture = false;
  String _enteredKeyword = "";
  String _errorFromApi = "";
  String? _errorText;
  List<Character> _allCharacters = <Character>[]; // this is an empty Character list
  List<Character> _filteredCharacters = <Character>[];
  late  HomeScreenContractPresenter _presenter;

  _HomeScreenViewState(){
    _presenter = HomeScreenPresenter(serviceLocator());
  }

  @override
  void initState() {
    super.initState();
    _presenter.attachView(this);
    _presenter.getCharacters();
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
                        child:
                        ListView.builder(
                            physics: const PageScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: _filteredCharacters.length,
                            itemBuilder: (BuildContext context, int index) =>
                                CharacterItem(
                                    character: _filteredCharacters[index],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    listener: this
                                )
                        )
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
                      onFieldSubmitted: (value){ _runFilter(value, _showOnlyCharactersWithPicture); },
                      onChanged: (value){ _runFilter(value, _showOnlyCharactersWithPicture); }
                  )
              ),

              Positioned(
                bottom: _spaceBetweenSwitchAndScreen, left: _spaceBetweenSwitchAndScreen, right: _spaceBetweenSwitchAndScreen,
                child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "show only characters with image?",
                              style: GoogleFonts.tillana(color: Colors.black, fontSize: 14)),
                          Switch(
                              activeColor: Colors.purple,
                              value: _showOnlyCharactersWithPicture,
                              onChanged: (value){ _runFilter(_enteredKeyword, value); }),
                        ]
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38
                    )
                ),
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

  @override
  setCharacters(List<Character> characters) {
    _allCharacters = characters;
    _filteredCharacters = characters;
    _showErrorFromApi = false;
    _areCharactersSet = true;
    setState(() { });
  }


  // private functions

  _runFilter(String enteredKeyword, bool showCharactersWithImage) {
    _enteredKeyword = enteredKeyword;
    _showOnlyCharactersWithPicture = showCharactersWithImage;

    List<Character> _result = <Character>[];
    if (_enteredKeyword.isEmpty) {
      _result = _allCharacters;
    } else {
      _result = _allCharacters
          .where((character) =>
          character.name!.toLowerCase().contains(_enteredKeyword.toLowerCase()))
          .toList();
    }
    if(_showOnlyCharactersWithPicture){
      _result = _result
          .where((character) => character.image!.isNotEmpty)
          .toList();
    }

    // Refresh the UI
    _filteredCharacters = _result;
    setState(() { });
  }

  @override
  updateCharacter(Character character) async {
    await _presenter.updateCharacter(character);
  }

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

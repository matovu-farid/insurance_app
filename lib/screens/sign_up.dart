

import 'dart:ui';

import 'package:family/Bloc/bloc_code.dart';
import 'package:family/Bloc/email_sender.dart';
import 'package:family/jsontry.dart';
import 'package:family/models/client.dart';
import 'package:family/models/clientList.dart';
import 'package:family/models/emails_of_bosses.dart';
import 'package:family/models/insurance_category.dart';

import 'package:family/models/preffered_insurer.dart';
import 'package:family/models/signup_state.dart';
import 'package:family/screens/customWigets/customRow.dart';
import 'package:family/screens/customWigets/customRow.dart';
import 'package:family/screens/starting_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:image/image.dart' as ImageClass;

//TODO dispose of all controllers
//TODO make sure someone cant submit until all field are filled
//TODO carry out tests
//TODO Optimize memory usage

class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  Gender _gender = Gender.FEMALE;

  Bloc bloc = Bloc();

   ScrollController _controller ;

  addToScoll(ScrollContext context) {}

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;

  @override
  void initState() {
    _controller = ScrollController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }




  String _item;

  var widgetList = <Widget>[];

  String _name;

  String _emailAddress;

  String _phoneNumber;

  String _password;

  String _insuranceType;

  String _insuranceCategory;

  String _preferedInsurer;

  String _genderToString;

  String get password => _password;

  String _ageBracketString;

  String get getPassword => _password;

  set setPassword(String value) {
    _password = value;

  }
  //------------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------------------------
//Custom Name Fields

//  CustomRow _namefields = CustomRow(
//    title: "Name",
//    obscureText1: false,
//    icon: Icon(Icons.supervised_user_circle),
//    error: "Enter full name",
//    validate:(value)=>value.isEmpty?"Enter full name":null,
//    textInputType: TextInputType.text,
//  );
  //--------------------------------------------------------------------------------------------------------

  // CustomRow _passwordfields = CustomRow(
  //   title: "Password",
  //   obscureText1: true,
  // );
//--------------------------------------------------------------------------------------------------------
////custom emailFields
//  CustomRow _emailfields = CustomRow(
//    textInputType: TextInputType.emailAddress,
//    title: "Email",
//    icon: Icon(Icons.mail),
//    obscureText1: false,
//    error: "Enter a valid email",
//    validate:(value)=>value.isEmpty?"Enter a valid email":null,
//
//
//  );
//  //---------------------------------------------------------------------------------------------------------
////Custom phone number fields
//  CustomRow _phoneNumberlfields = CustomRow(
//    textInputType: TextInputType.number,
//    title: "Phone number",
//    icon: Icon(Icons.phone_android),
//    obscureText1: false,
//    error: "Enter phone number",
//    validate:(value)=>value.isEmpty?"Enter phone number":null,
//  );
//-----------------------------------------------------------------------------------------------
//Method to send an email
  addToListandSendEmail() {
    ClientData client = ClientData(
        _name,
        _ageBracketString,
        _genderToString,
        _insuranceType,
        _emailAddress,
        _phoneNumber,
        _insuranceCategory,
        _preferedInsurer);
    ClientList.clientList.add(client);
    CustomEmailSender(client).send();

  }
  //----------------------------------------------------------------------------------
  //regex for phone
  Pattern pattern = r'(\d{10})';



  //-------------------------------------------------------------------------------------------------
// Method to submit and validate form fields
  submit(BuildContext context) {
    FormState formstate= formKey.currentState;
    formstate.validate();
    formstate.save();



    _name = _nameController.text;
    _emailAddress = _emailController.text;
    // _password = _passwordfields.getText;
    _phoneNumber = _phoneController.text;


    if (_name.isNotEmpty && _phoneNumber.isNotEmpty && _emailAddress.isEmpty){

    addToListandSendEmail();}

  }
  //-------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: SignupModel(),
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton.extended(
            splashColor: Colors.white70,
            onPressed: () => submit(context),
            backgroundColor: Colors.deepPurple,
            label: Text("Submit"),
          ),
          body: CustomScrollView(slivers: [
            SliverAppBar(
              flexibleSpace: SafeArea(
                  child: SizedBox(
                height: 10,
              )),
              centerTitle: true,
              pinned: true,
              primary: true,
              snap: true,
              backgroundColor: Colors.deepPurple,
              expandedHeight: 80,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget>[

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[Text("QUOTATION REQUEST"),
                  SizedBox(width: 60,),
                  SizedBox(width: 60,height: 60,child: StartingScreen.image,)] )]),
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [

                  Builder(builder: (context){
                  return buildRow(title: "Name",

                    obscureText1: false,
                    controller: _nameController,
                    icon: Icon(Icons.supervised_user_circle),
                    error: "Enter full name",
                    validate:(value)=>value.isEmpty?"Enter full name":null,
                    textInputType: TextInputType.text, );
                  }),
                  Builder(builder: (context){

                    return buildRow(textInputType: TextInputType.emailAddress,
                      controller: _emailController,
                      title: "Email",
                      icon: Icon(Icons.mail),
                      obscureText1: false,
                      error: "Enter a valid email",
                      hint: "___________.@_____.com",

                      validate:(value)=>(!((value.endsWith(".com"))&&value.contains("@")))?"Enter a valid email":null);

                  }),
                  Builder(builder: (context){
                    return buildRow(textInputType: TextInputType.number,
                      controller: _phoneController,
                      title: "Phone number",
                      icon: Icon(Icons.phone_android),
                      hint: "07XXXXXXXX",
                      obscureText1: false,
                      error: "Enter phone number",
                      validate:(value)=>((!(RegExp(pattern).hasMatch(value)))||!(value.startsWith("07")))?"Enter a valid phone number":null,);
                  }),
                  //--------------------------------------------------------------------------------------------------

//              SizedBox(
//                height: 25,
//                child: CustomScrollView(
//
//                  slivers: [StreamBuilder<String>(
//
//                    stream: PreferedInsurer().outputPreIns.stream,
//                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//
//                      return SliverList(delegate: SliverChildBuilderDelegate((context,index){
//                        return ListView.builder(
//
//                            itemBuilder: (_,__){
//
//                          return ListTile(title: Text(snapshot.data),);
//                        });
//                      }),);
//                  },),
//                ]),
//              ),
                  //---------------------------------------------------------------------------------
//                SizedBox(
//                  height: 300,
//                  child: StreamBuilder<String>(
//
//                        stream: bloc.stream,
//                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                          if(snapshot.connectionState==ConnectionState.waiting){
//
//                            return Text('Waiting....');
//                          }else if(snapshot.connectionState==ConnectionState.done){
//                            return ListView.builder(
//                                itemCount: bloc.list.length,
//                                itemBuilder: (_,__){
//
//                                  return ListTile(title: Text(snapshot.data ?? "Scroll down"),);
//                                });
//                            return Text('done');
//                      }else if (snapshot.connectionState==ConnectionState.active){
//                            return ListView.builder(
//                                itemCount: bloc.list.length,
//                                itemBuilder: (_,__){
//
//                                  return ListTile(title: Text(snapshot.data ?? "Scroll down"),);
//                                });
//                          }
//                          else{
//                            return Text("Error");
//                          }
//
//
//
//
//                        },),
//
//

//                ),
                  //-----------------------------------------------------------------------------------------------------------------------
//TODO turn the stream from to a streamList of Images
//                 StreamBuilder(
//                   stream: Logo().streamOfImages(),
//                   builder: (context, snapshot) {
//                     return ListCombo<String>(
//                       child: const Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Text('Combo child'),
//                       ),
//                       getList: () async {
//                         await Future.delayed(const Duration(milliseconds: 500));
//
//                         return ['Item1', 'Item2', 'Item3'];
//                       },
//                       itemBuilder: (context, parameters, item) =>
//                           ListTile(title: Text(item)),
//                       onItemTapped: (item) {},
//                     );
//                   },
//                 ),
                  //---------------------------------------------------------------------------------------------
                  //----------------------------for the stream
                  // SizedBox(
                  //   height: 50,
                  //   child: StreamBuilder<String>(
                  //     stream: bloc.stream,
                  //     builder:  (context, snapshot) {

                  //       while(snapshot.connectionState==ConnectionState.active)
                  //       {widgetList.add(FlatButton(child: Text(snapshot.data??"Waiting..."),onPressed: ()=>{},));
                  //         return  FlatButton(child: Text(snapshot.data??"Waiting..."));}
                  //       return CustomScrollView(

                  //        slivers: [SliverToBoxAdapter(

                  //          child:Column(children:widgetList, ))]);
                  //     }
                  //   )

                  // ),
                  //--------------------------------------------------------------------------------------------
                  // SizedBox(
                  //   height: 50,
                  //   child: StreamBuilder<Map<String,Image>>(
                  //     stream: Logo().streamOfImages(),
                  //     builder:  (context, snapshot) {

                  //       while(snapshot.connectionState==ConnectionState.active)
                  //       {widgetList.add(FlatButton(child: Text(snapshot.data.keys.first??"Waiting..."),onPressed: ()=>{},));
                  //         return  FlatButton(child: Text(snapshot.data.keys.first??"Waiting..."));}
                  //       return CustomScrollView(

                  //        slivers: [SliverToBoxAdapter(

                  //          child:Column(children:widgetList, ))]);
                  //     }
                  //   )

                  // ),
                  //--------------------------------------------------------------------------------------------
                  //email

                  // SizedBox(
                  //   height: 10,
                  // ),


                  SizedBox(
                    height: 10,
                  ),

                  //-------------------------------------------------------------------
                  //male radio button
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: 200,
                          height: 60,
                          child: ScopedModelDescendant<SignupModel>(
                            builder: (BuildContext context, Widget child,
                                SignupModel model) {
                              return RadioListTile(
                                activeColor: Colors.redAccent,
                                value: model.genderMapper[Gender.MALE],
                                groupValue: model.commonRadio,
                                onChanged: (value) => model.onchange(),
                                title: Text("Male"),
                              );
                            },
                          )),
                      //-----------------------------------------------------------------------
                      //radio button
                      Expanded(
                        child: SizedBox(
                            width: 200,
                            height: 60,
                            child: ScopedModelDescendant<SignupModel>(
                              builder: (BuildContext context, Widget child,
                                  SignupModel model) {
                                return RadioListTile(
                                  activeColor: Colors.redAccent,
                                  value: model.genderMapper[Gender.FEMALE],
                                  groupValue: model.commonRadio,
                                  onChanged: (value) => model.onchange(),
                                  title: Text("Female"),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                  //----------------------------------------------------------------------------------------
                  // //data from fire store
                  // StreamBuilder<QuerySnapshot>(
                  //   stream: Firestore.instance.collection("preffered_insurer").snapshots(),
                  //   builder:(_,snapshot){
                  //     List<DropdownMenuItem> listofDropdownItems;
                  //     if(snapshot.hasData){
                  //      for(int i;i<snapshot.data.documents.length;i++){
                  //        DocumentSnapshot docSnapshot = snapshot.data.documents[i] ;
                  //        listofDropdownItems.add(DropdownMenuItem(
                  //          value:docSnapshot.documentID,
                  //          child: Text(docSnapshot.documentID),));

                  //      }

                  //     }
                  //     return DropdownButton(items: listofDropdownItems, onChanged: null,value: listofDropdownItems.first,);
                  //   }),
                  //----------------------------------------------------------------------------------------
                  //Form
                  ScopedModelDescendant<SignupModel>(
                    builder:
                        (BuildContext context, Widget child, SignupModel model) {
                      return Column(
                        children: <Widget>[
                          //-----------------------------------------------------------------------------------------
                          //Age
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      hintText: "Age Bracket    ",
                                      hintStyle: TextStyle(fontSize: 18),

                                      filled: true,
                                      enabled: false

                                  ),

                                  items: model.ageDropBracket,
                                  onChanged: (item1) =>
                                      model.onAgeChanged(item1),
                                  onSaved: (ageBracketGot) =>
                                      _ageBracketString = ageBracketGot,
                                ),
                              ),
                            ],
                          ),

                          //------------------------------------------------------------------------------------------
                          //Category
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                hintText: "Insurance Category   ",
                                hintStyle: TextStyle(fontSize: 18),
                                filled: true,
                                enabled: false),
                            icon: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),

                              ],
                            ),

                            items: model.catList,
                            onChanged: (item1) => model.onChangedItem(item1),
                            onSaved: (category) => insuranceCategory = category,
                          ),

                          //-----------------------------------------------------------------------
                          //prefferd insurer
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: "Prefered Insurer ",
                              hintStyle: TextStyle(fontSize: 18),
                              filled: true,
                              enabled: false,


                            ),

                            items: model.prefferedInsDropList,
                            onChanged: (item1) =>
                                model.onPrefferdChanged(item1),
                            icon: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),

                              ],
                            ),
                            onSaved: (prefedInsurer) {
                              _preferedInsurer = prefedInsurer;
                            },
                          ),

                          //-------------------------------------------------------
                          //type of insurance
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 18),
                              filled: true,
                              enabled: false,
                              hintText: "Type of Insurance"),

                            items: model.typDropList,
                            onChanged: (item1) => model.onTypeChanged(item1),
                            icon: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),

                              ],
                            ),
                            onSaved: (type) {
                              _insuranceType = type;
                              _genderToString = model.getGender();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  set name(String value) {
    _name = value;
  }

  get phoneNumber => _phoneNumber;

  get emailAddress => _emailAddress;

  get gender => _gender;

  get ageBracket => _ageBracketString;

  get name => _name;

  set emailAddress(String value) {
    _emailAddress = value;
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get insuranceType => _insuranceType;

  String get insuranceCategory => _insuranceCategory;

  String get preferedInsurer => _preferedInsurer;

  set ageBracket(String value) {
    _ageBracketString = value;
  }

  set preferedInsurer(String value) {
    _preferedInsurer = value;
  }

  set insuranceCategory(String value) {
    _insuranceCategory = value;
  }

  set insuranceType(String value) {

    _insuranceType = value;
  }
  Widget buildRow({BuildContext context,
    TextEditingController controller,
    bool obscureText1 ,
    Icon icon,
    String error,
    String hint,
    FormFieldValidator<String> validate, TextInputType textInputType, String title,}) {

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              autofocus: false,

              textInputAction: TextInputAction.done,
              maxLines: 2,
              minLines: 1,
              enableSuggestions: true,
              toolbarOptions: ToolbarOptions(
                  copy: true, cut: true, paste: true, selectAll: true),
              smartDashesType: SmartDashesType.enabled,
              smartQuotesType: SmartQuotesType.enabled,
              maxLengthEnforced: true,
              cursorColor: Colors.greenAccent,
              keyboardType: textInputType,

              validator: validate,

              decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.green,
                      decorationStyle: TextDecorationStyle.wavy),
                  enabled: true,
                  filled: true,
                  border: UnderlineInputBorder(borderSide: BorderSide.merge(
                      BorderSide(style: BorderStyle.solid),
                      BorderSide(style: BorderStyle.solid))),

                  labelText: title,
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true,


                  prefixIcon: icon ??
                      SizedBox(
                        width: 10,
                      ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              obscureText: obscureText1,
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class InquiryPage extends StatefulWidget {
  @override
  _InquiryPageState createState() => _InquiryPageState();
}

class _InquiryPageState extends State<InquiryPage> {
  TextEditingController companycodeController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();

  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusScopeNode _node = FocusScopeNode();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView(
        children: [
          Form(
            key: _formKey,
            child: FocusScope(
              node: _node,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(),
                          hintText: 'enter your full name',
                          prefixIcon: Icon(Icons.person)),
                      onEditingComplete: _node.nextFocus,
                      controller: companycodeController,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Name can not be blank.";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _node.nextFocus,
                      controller: namecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'enter your email address',
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email address can not be blank.";
                        }
                        /* else if (!EmailValidator.validate(value)) {
                                return "Please enter a valid email";
                              }*/
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: IntlPhoneField(

                        decoration: InputDecoration(
                          hintText: 'Phone Number',

                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),

                          ),
                        ),

                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                  ),

                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 6,),
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(),
                                  hintText: 'City',
                                  prefixIcon: Icon(Icons.location_city)),
                              onEditingComplete: _node.nextFocus,
                              controller: citycontroller,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "City can not be blank.";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        SizedBox(width: 6,),
                        Expanded(
                          child: Container(
                              child: TextFormField(
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(),
                                    hintText: 'State',
                                    prefixIcon: Icon(Icons.location_city)),
                                onEditingComplete: _node.nextFocus,
                                controller: statecontroller,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "State can not be blank.";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              )
                          ),
                        ),
                        SizedBox(width: 6,),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(5.0) ,
                              child:TextFormField(
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(),
                                    hintText: 'Pin code',
                                    prefixIcon: Icon(Icons.code)),
                                onEditingComplete: _node.nextFocus,
                                controller: pincodecontroller,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Pin code can not be blank.";
                                  }else if(value.length >5){
                                    return "Pin code is not valid.";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              )
                          ),
                        ),


                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onEditingComplete: _node.nextFocus,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textInputAction: TextInputAction.go,
                      controller: messagecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'add message..',
                          fillColor: Colors.black),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Message can not be blank.";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsets.all(2.0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text(
                            'Send',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print(companycodeController.text);
                              print(namecontroller.text);
                              print(passwordcontroller.text);

                              final Email email = Email(
                                body: 'Email body',
                                subject: namecontroller.text,
                                recipients: ['sodoson760@cyberper.net'],
                                cc: ['abc@gmail.com'],
                                bcc: ['abc@gmail.com'],
                                isHTML: false,
                              );
                              FlutterEmailSender.send(email);
                            }
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

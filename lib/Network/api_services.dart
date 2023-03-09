import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:hotlier/Network/server_error.dart';

import '../common/Storage/storage_handler.dart';
import '../common/check_connectivity.dart';
import '../common/toast.dart';


class API {
  CheckConnectivityServices connectivityServices = CheckConnectivityServices();
  Future getRequest(
    String apiurl,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        options: DIO.Options(headers: {
          'accept': '*/*',
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        // if (onError is DioError) {
        //     ShowMessage().showErrorMessage("No internet connection!");
        //   }

        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (error) {
      if (error is SocketException) {
        ShowMessage().showErrorMessage("No internet connection!");
      } else {
        if (error is DIO.DioError) {
          if (ServerError.withError(error: error).getErrorCode() == 401) {
            print('Error');
          } else {
            ShowMessage().showErrorMessage(ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
          }
        }
      }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future getRequestHeader(String apiurl) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      print("apiurl $apiurl");
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        options: DIO.Options(headers: {
          // if (firebaseToken != "")
          //   "Authorization": "Firebase ${firebaseToken.toString()}",
          'accept': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (error) {
      if (error is SocketException) {
        ShowMessage().showErrorMessage("No internet connection!");
      } else {
        if (error is DIO.DioError) {
          if (ServerError.withError(error: error).getErrorCode() == 401) {
            print('Error');
          } else {
            ShowMessage().showErrorMessage(ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
          }
        }
      }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future postRequest(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();
print(apiurl);
      var response = await dio.post(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");

      }).catchError((onError) {

        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          ShowMessage().showErrorMessage("No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              print('Error');
            } else {
              ShowMessage().showErrorMessage(
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   ShowMessage().showErrorMessage("No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       print('Error');
      //     } else {
      //       print("error$error");
      //       ShowMessage().showErrorMessage(ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future postRequestHeader(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.post(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          ShowMessage().showErrorMessage("No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              print('Error');
            } else {
              ShowMessage().showErrorMessage(
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   ShowMessage().showErrorMessage("No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       print('Error');
      //     } else {
      //       ShowMessage().showErrorMessage(ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future patchRequestHeader(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.patch(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          ShowMessage().showErrorMessage("No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              print('Error');
            } else {
              ShowMessage().showErrorMessage(
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   ShowMessage().showErrorMessage("No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       print('Error');
      //     } else {
      //       ShowMessage().showErrorMessage(ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future putRequest(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();

      var response = await dio.put(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // if (firebaseToken != "")
          //   "Authorization": "Firebase ${firebaseToken.toString()}",
          // if (firebaseToken == "")
          //   "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          ShowMessage().showErrorMessage("No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              print('Error');
            } else {
              ShowMessage().showErrorMessage(
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   ShowMessage().showErrorMessage("No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       print('Error');
      //     } else {
      //       ShowMessage().showErrorMessage(ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future putRequestHeader(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.put(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          ShowMessage().showErrorMessage("No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              print('Error');
            } else {
              ShowMessage().showErrorMessage(
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   ShowMessage().showErrorMessage("No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       print('Error');
      //     } else {
      //       ShowMessage().showErrorMessage(ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }

  Future profileUpdateMiltiPart(
    String apiurl,
    var data,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    var token = await GetStorageHandler().getToken();
    DIO.FormData formData;
    String fileName = await data["photo"].split('/').last;
    print("fileName $fileName");
    formData = DIO.FormData.fromMap({
      "photo":
          await DIO.MultipartFile.fromFile(data["photo"], filename: fileName),
      "name": data["name"],
      "bio": data["bio"],
      "phone": data["phone"],
      "country_code": data["country_code"],
      "phone_code": data["phone_code"],
      "date_of_birth": data["dateOfBirth"],
      "country": data["country"],
      "locale": data["language"],
      "_method": "PATCH"
    });
    print("formData ${formData.fields}");

    try {
      var dio = DIO.Dio();
      var response = await dio.post(
        apiurl,
        data: formData,
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          ShowMessage().showErrorMessage("No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              print('Error');
            } else {
              ShowMessage().showErrorMessage(
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });
      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   ShowMessage().showErrorMessage("No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       print('Error');
      //     } else {
      //       ShowMessage().showErrorMessage(ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   ShowMessage().showErrorMessage("No internet connection, try later");
    // }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

//API service for the FindMyRent backend
//handles authentication, verification and user creation endpoints

class ApiService {
  static const String baseUrl = 'https://ground-shakers.xyz';

  static Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  //send email verification code
  static Future<Map<String, dynamic>> sendVerificationCode(String email) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/verification/email/send');

    final response = await http.post(url,
        headers: headers, body: jsonEncode({'email': email}));
    return _handleResponse(response);
  }

  // verify code sent to email
  static Future<Map<String, dynamic>> verifyEmailCode({
    required String email,
    required String code,
  }) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/verification/email');

    final response = await http.post(url,
        headers: headers, body: jsonEncode({'email': email, 'code': code}));

    return _handleResponse(response);
  }

  //create new user
  static Future<Map<String, dynamic>> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String verifyPassword,
    required String phoneNumber,
    required String dateOfBirth,
    required String gender,
  }) async {
    final url = Uri.parse('$baseUrl/api/v1/users');

    // Parse date of birth from DD/MM/YYYY to required format
    final dateParts = dateOfBirth.split('/');
    final dobObject = {
      'day': int.parse(dateParts[0]),
      'month': int.parse(dateParts[1]),
      'year': int.parse(dateParts[2]),
    };

    final body = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'verify_password': verifyPassword,
      'date_of_birth': dobObject,
      'gender': gender.toLowerCase(),
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  //login
  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    return _handleResponse(response);
  }

//refresh token
  static Future<Map<String, dynamic>> refreshAccessToken(
      String refreshToken) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/refresh');

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'refresh_token': refreshToken}),
    );

    return _handleResponse(response);
  }

//logout
  static Future<Map<String, dynamic>> logout(String refreshToken) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/logout');

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'refresh_token': refreshToken}),
    );

    return _handleResponse(response);
  }

  //logout of all devices
  static Future<Map<String, dynamic>> logoutAllDevices(
      String refreshToken) async {
    final url = Uri.parse('$baseUrl/api/v1/auth/logout-all');

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'refresh_token': refreshToken}),
    );

    return _handleResponse(response);
  }

  //create KYC verification session
  static Future<Map<String, dynamic>> createKycSession(
      String accessToken) async {
    final url = Uri.parse('$baseUrl/api/v1/kyc/session');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    return _handleResponse(response);
  }

  //get user profile
  static Future<Map<String, dynamic>> getUserProfile(String accessToken) async {
    final url = Uri.parse('$baseUrl/api/v1/users/me');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    return _handleResponse(response);
  }

  //function for handling API responses

  static Map<String, dynamic> _handleResponse(http.Response response) {
    final status = response.statusCode;
    final body = response.body.isNotEmpty ? jsonDecode(response.body) : {};

    print({response.body});

    if (status >= 200 && status < 300) {
      return body;
    } else {
      throw Exception(
          'API Error ($status): ${body['detail'] ?? response.reasonPhrase}');
    }
  }
}

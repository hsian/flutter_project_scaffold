# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**moviesGet**](DefaultApi.md#moviesget) | **GET** /movies | Get a list of movies
[**moviesIdGet**](DefaultApi.md#moviesidget) | **GET** /movies/{id} | Get a movie by ID


# **moviesGet**
> List<Movie> moviesGet()

Get a list of movies

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();

try {
    final result = api_instance.moviesGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->moviesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Movie>**](Movie.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **moviesIdGet**
> Movie moviesIdGet(id)

Get a movie by ID

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = id_example; // String | 

try {
    final result = api_instance.moviesIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->moviesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Movie**](Movie.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


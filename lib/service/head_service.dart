import 'package:dio/dio.dart';
import 'package:request_handler/config/dio_config.dart';

Future<dynamic> head(
    // Request parametrs
    {
  required String url,
  required Map<String, dynamic> data,
  Options? options,
  Map<String, dynamic>? queryParametrs,
  CancelToken? cancelToken,
  // Default time outs are 59 sekund
  int? defaultTimeOuts,
}) async {
  try {
    Response response =
        await DioConfig.createRequest(defaultTimeOuts: defaultTimeOuts).head(
            queryParameters: queryParametrs,
            cancelToken: cancelToken,
            url,
            data: data,
            options: options);

    // Status code successful?
    switch (response.statusCode) {
      // Information status codes
      case 100:
        return "You may continue or ignore this.";
      case 101:
        return "You may continue or ignore this.";
      case 102:
        return "This code is sent in response to an Upgrade request header from the client and indicates the protocol the server is switching ";

      // Successfull status codes
      case 200:
        return response;
      case 201:
        return response;
      case 202:
        return response;
      case 203:
        return response;
      case 204:
        return response;
      case 205:
        return response;
      case 206:
        return response;
      case 207:
        return response;
      case 208:
        return response;
      case 226:
        return response;
      //  Redirection messages

      case 300:
        return "The request has more than one possible response. The user agent or user should choose one of them";
      case 301:
        return "The URL of the requested resource has been changed permanently. The new URL is given in the response.";
      case 302:
        return "This response code means that the URI of requested resource has been changed temporarily";
      case 303:
        return "The server sent this response to direct the client to get the requested resource at another URI with a GET request.";
      case 304:
        return "Defined in a previous version of the HTTP specification to indicate that a requested response must be accessed by a proxy. It has been deprecated due to security concerns regarding in-band configuration of a proxy";
      case 305:
        return "Defined in a previous version of the HTTP specification to indicate that a requested response must be accessed by a proxy";
      case 306:
        return "This response code is no longer used; it is just reserved. It was used in a previous version of the HTTP/1.1 specification.";
      case 307:
        return "The server sends this response to direct the client to get the requested resource at another URI with same method that was used in the prior request";
      case 308:
        return "This means that the resource is now permanently located at another URI, specified by the Location: HTTP Response header.";

      //Client error responses
      case 400:
        return "The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).";
      case 401:
        return """Although the HTTP standard specifies "unauthorized", semantically this response means "unauthenticated". That is, the client must authenticate itself to get the requested response.""";
      case 402:
        return "This response code is reserved for future use. The initial aim for creating this code was using it for digital payment systems, however this status code is used very rarely and no standard convention exists.";
      case 403:
        return "The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource. Unlike 401 Unauthorized, the client's identity is known to the server.";
      case 404:
        return "The server cannot find the requested url. In the browser, this means the URL is not recognized. In an API, this can also mean that the endpoint is valid but the resource itself does not exist";
      case 405:
        return "The request method is known by the server but is not supported by the target resource. For example, an API may not allow calling DELETE to remove a resource.";
      case 406:
        return "This response is sent when the web server, after performing server-driven content negotiation, doesn't find any content that conforms to the criteria given by the user agent";
      case 407:
        return "This is similar to 401 Unauthorized but authentication is needed to be done by a proxy.";
      case 408:
        return "This response is sent on an idle connection by some servers, even without any previous request by the client. It means that the server would like to shut down this unused connection.";
      case 409:
        return "This response is sent when a request conflicts with the current state of the server.";
      case 410:
        return "This response is sent when the requested content has been permanently deleted from server, with no forwarding address.";
      case 411:
        return "The server rejected the request because the Content-Length header field is not defined and the server requires it.";
      case 412:
        return "The client has indicated preconditions in its headers which the server does not meet.";
      case 413:
        return "Request entity is larger than limits defined by server. The server might close the connection or return an Retry-After header field.";
      case 414:
        return "The URI requested by the client is longer than the server is willing to interpret.";
      case 415:
        return "The media format of the requested data is not supported by the server, so the server is rejecting the request.";
      case 416:
        return "The range specified by the Range header field in the request cannot be fulfilled. It's possible that the range is outside the size of the target URI's data.";
      case 417:
        return "This response code means the expectation indicated by the Expect request header field cannot be met by the server.";
      case 418:
        return "The server refuses the attempt to brew coffee with a teapot.";
      case 421:
        return "The request was directed at a server that is not able to produce a response. This can be sent by a server that is not configured to produce responses for the combination of scheme and authority that are included in the request URI.";
      case 422:
        return "The request was well-formed but was unable to be followed due to semantic errors.";
      case 423:
        return "The resource that is being accessed is locked.";
      case 424:
        return "The request failed due to failure of a previous request.";
      case 425:
        return "Indicates that the server is unwilling to risk processing a request that might be replayed.";
      case 426:
        return "The server refuses to perform the request using the current protocol but might be willing to do so after the client upgrades to a different protocol. ";
      case 428:
        return "The origin server requires the request to be conditional. This response is intended to prevent the 'lost update' problem, where a client GETs a resource's state, modifies it and PUTs it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict.";
      case 429:
        return """The user has sent too many requests in a given amount of time ("rate limiting").""";
      case 431:
        return "The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields.";
      case 451:
        return "The user agent requested a resource that cannot legally be provided, such as a web page censored by a government.";
      // Server error responses
      case 500:
        return "The server has encountered a situation it does not know how to handle.";
      case 501:
        return "The request method is not supported by the server and cannot be handled. The only methods that servers are required to support (and therefore that must not return this code) are GET and HEAD.";
      case 502:
        return "This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response.";
      case 503:
        return "The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded.";
      case 504:
        return "This error response is given when the server is acting as a gateway and cannot get a response in time.";
      case 505:
        return "The HTTP version used in the request is not supported by the server.";
      case 506:
        return "The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process.";
      case 507:
        return "The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request.";
      case 508:
        return "The server detected an infinite loop while processing the request.";
      case 510:
        return "Further extensions to the request are required for the server to fulfill it.";
      case 511:
        return "Indicates that the client needs to authenticate to gain network access.";
      default:
        return "The response is not successfull!!!";
    }
  } on DioError catch (e) {
    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return "Server time out error";
    } else {
      return "No internet connection";
    }
  }
}

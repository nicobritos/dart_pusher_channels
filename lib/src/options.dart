const _kClient = 'dart';

class PusherOptions {
  final String scheme;
  final String? cluster;
  final int port;
  final String key;
  final int protocol;
  final String version;
  final String _host;

  PusherOptions(
      {required this.scheme,
      required String host,
      this.cluster,
      required this.port,
      required this.key,
      required this.protocol,
      required this.version})
      : _host = cluster == null ? host : 'ws-$cluster.$host';

  PusherOptions.ws({
    String? cluster,
    required int port,
    required String key,
    required int protocol,
    required String version,
    required String host,
  }) : this(
            scheme: 'ws',
            cluster: cluster,
            host: host,
            port: port,
            key: key,
            protocol: protocol,
            version: version);

  PusherOptions.wss({
    String? cluster,
    required int port,
    required String key,
    required int protocol,
    required String version,
    required String host,
  }) : this(
            scheme: 'wss',
            cluster: cluster,
            host: host,
            port: port,
            key: key,
            protocol: protocol,
            version: version);

  Uri get uri => Uri(
          scheme: scheme,
          host: _host,
          port: port,
          path: '/app/$key',
          queryParameters: {
            'client': _kClient,
            'version': version.toString(),
            'protocol': protocol.toString()
          });
}

local common = import 'common.libsonnet';

{
   fetcher: {
      caching: {
      fetcher: {
        http: {
          allowUpdatesForInstances: [''],
          contentAddressableStorage: common.blobstore.contentAddressableStorage,
    }}}},

  assetCache: {
    actionCache: {
      blobstore: common.blobstore,
    },
  },
  global: {},
  grpcServers: [{
    listenAddresses: [':9000'],
    authenticationPolicy: { allow: {} },
  }],
  allowUpdatesForInstances: [''],
  maximumMessageSizeBytes: common.maximumMessageSizeBytes,
}

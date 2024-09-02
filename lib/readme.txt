

   # https://pub.dev/packages/path_provider/install
   path_provider: ^2.1.1
 //临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除的临时目录（缓存）。
    // 在iOS上，这对应于NSTemporaryDirectory() 返回的值。在Android上，这是getCacheDir()返回的值。
    //
    //
    // 文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，
    // 该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。
    // 在iOS上，这对应于NSDocumentDirectory。在Android上，这是AppData目录。
    //
    //
    // 外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如SD卡；
    // 由于iOS不支持外部目录，所以在iOS下调用该方法会抛出UnsupportedError异常，
    // 而在Android下结果是android SDK中getExternalStorageDirectory的返回值。

    //final Directory tempDir = await getTemporaryDirectory();
    //final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    //final Directory? downloadsDir = await getDownloadsDirectory();
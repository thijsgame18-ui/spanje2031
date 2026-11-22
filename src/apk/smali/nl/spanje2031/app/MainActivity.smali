.class public Lnl/spanje2031/app/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/spanje2031/app/MainActivity$Bridge;
    }
.end annotation


# static fields
.field private static final AUTH_REQ:I = 0x2b

.field private static final FILE_REQ:I = 0x2a

.field private static final SAVE_REQ:I = 0x2c

.field static current:Lnl/spanje2031/app/MainActivity;


# instance fields
.field private fileCb:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback",
            "<[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private pendingSave:Ljava/lang/String;

.field private pendingUpdate:Ljava/lang/String;

.field private web:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/ValueCallback;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->fileCb:Landroid/webkit/ValueCallback;

    return-object v0
.end method

.method static synthetic access$002(Lnl/spanje2031/app/MainActivity;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity;->fileCb:Landroid/webkit/ValueCallback;

    return-object p1
.end method

.method static synthetic access$100(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lnl/spanje2031/app/MainActivity;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lnl/spanje2031/app/MainActivity;->installSession(Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$400(Lnl/spanje2031/app/MainActivity;)V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lnl/spanje2031/app/MainActivity;->superBack()V

    return-void
.end method

.method static synthetic access$502(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity;->pendingUpdate:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lnl/spanje2031/app/MainActivity;->startUpdate(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$702(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity;->pendingSave:Ljava/lang/String;

    return-object p1
.end method

.method private installSession(Ljava/io/File;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v9, 0x1f

    const/4 v2, 0x1

    const/4 v6, 0x0

    .line 122
    invoke-virtual {p0}, Lnl/spanje2031/app/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    move-result-object v0

    .line 123
    new-instance v1, Landroid/content/pm/PackageInstaller$SessionParams;

    invoke-direct {v1, v2}, Landroid/content/pm/PackageInstaller$SessionParams;-><init>(I)V

    .line 124
    invoke-virtual {p0}, Lnl/spanje2031/app/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageInstaller$SessionParams;->setAppPackageName(Ljava/lang/String;)V

    .line 125
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v9, :cond_0

    .line 126
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setRequireUserAction"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :cond_0
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageInstaller;->createSession(Landroid/content/pm/PackageInstaller$SessionParams;)I

    move-result v7

    .line 129
    invoke-virtual {v0, v7}, Landroid/content/pm/PackageInstaller;->openSession(I)Landroid/content/pm/PackageInstaller$Session;

    move-result-object v0

    .line 130
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 131
    const-string v1, "spanje2031.apk"

    const-wide/16 v2, 0x0

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/pm/PackageInstaller$Session;->openWrite(Ljava/lang/String;JJ)Ljava/io/OutputStream;

    move-result-object v1

    .line 132
    const/high16 v2, 0x10000

    new-array v2, v2, [B

    .line 133
    :goto_1
    invoke-virtual {v8, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_1

    invoke-virtual {v1, v2, v6, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1

    .line 134
    :cond_1
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageInstaller$Session;->fsync(Ljava/io/OutputStream;)V

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 135
    new-instance v2, Landroid/content/Intent;

    const-class v1, Lnl/spanje2031/app/InstallReceiver;

    invoke-direct {v2, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 136
    const/high16 v3, 0x8000000

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v9, :cond_2

    const/high16 v1, 0x2000000

    :goto_2
    or-int/2addr v1, v3

    .line 137
    invoke-static {p0, v7, v2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 138
    invoke-virtual {v1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageInstaller$Session;->commit(Landroid/content/IntentSender;)V

    .line 139
    invoke-virtual {v0}, Landroid/content/pm/PackageInstaller$Session;->close()V

    .line 140
    return-void

    :cond_2
    move v1, v6

    .line 136
    goto :goto_2

    .line 126
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private js(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lnl/spanje2031/app/MainActivity$3;

    invoke-direct {v0, p0, p1}, Lnl/spanje2031/app/MainActivity$3;-><init>(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 110
    return-void
.end method

.method private startUpdate(Ljava/lang/String;)V
    .locals 5

    .prologue
    .line 144
    :try_start_0
    const-string v0, "download"

    invoke-virtual {p0, v0}, Lnl/spanje2031/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    .line 145
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lnl/spanje2031/app/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 146
    new-instance v2, Ljava/io/File;

    const-string v3, "Spanje2031-update.apk"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 147
    :cond_0
    new-instance v1, Landroid/app/DownloadManager$Request;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 148
    const-string v2, "Spanje 2031 update"

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 149
    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 150
    const/4 v2, 0x0

    const-string v3, "Spanje2031-update.apk"

    invoke-virtual {v1, p0, v2, v3}, Landroid/app/DownloadManager$Request;->setDestinationInExternalFilesDir(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 151
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 152
    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v2

    .line 153
    const-string v1, "window.onUpdateStatus&&window.onUpdateStatus(\'download\',0)"

    invoke-direct {p0, v1}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    .line 154
    new-instance v1, Ljava/lang/Thread;

    new-instance v4, Lnl/spanje2031/app/MainActivity$4;

    invoke-direct {v4, p0, v0, v2, v3}, Lnl/spanje2031/app/MainActivity$4;-><init>(Lnl/spanje2031/app/MainActivity;Landroid/app/DownloadManager;J)V

    invoke-direct {v1, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 183
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    :goto_0
    return-void

    .line 184
    :catch_0
    move-exception v0

    const-string v0, "window.onUpdateStatus&&window.onUpdateStatus(\'error\',0)"

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private superBack()V
    .locals 0

    .prologue
    .line 229
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    const/4 v4, -0x1

    const/4 v1, 0x0

    .line 189
    const/16 v3, 0x2c

    if-ne p1, v3, :cond_0

    .line 191
    if-ne p2, v4, :cond_7

    if-eqz p3, :cond_7

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_7

    iget-object v3, p0, Lnl/spanje2031/app/MainActivity;->pendingSave:Ljava/lang/String;

    if-eqz v3, :cond_7

    .line 192
    :try_start_0
    invoke-virtual {p0}, Lnl/spanje2031/app/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v3

    iget-object v4, p0, Lnl/spanje2031/app/MainActivity;->pendingSave:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    :goto_0
    iput-object v2, p0, Lnl/spanje2031/app/MainActivity;->pendingSave:Ljava/lang/String;

    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "window.onFileSaved&&window.onFileSaved("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    .line 215
    :goto_1
    return-void

    .line 192
    :catch_0
    move-exception v0

    move v0, v1

    goto :goto_0

    .line 198
    :cond_0
    const/16 v3, 0x2b

    if-ne p1, v3, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "window.onDeviceAuth&&window.onDeviceAuth("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-ne p2, v4, :cond_1

    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    move v0, v1

    goto :goto_2

    .line 199
    :cond_2
    const/16 v3, 0x2a

    if-ne p1, v3, :cond_5

    iget-object v3, p0, Lnl/spanje2031/app/MainActivity;->fileCb:Landroid/webkit/ValueCallback;

    if-eqz v3, :cond_5

    .line 201
    if-ne p2, v4, :cond_6

    if-eqz p3, :cond_6

    .line 202
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v3

    .line 203
    if-eqz v3, :cond_3

    .line 204
    invoke-virtual {v3}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    new-array v0, v0, [Landroid/net/Uri;

    .line 205
    :goto_3
    invoke-virtual {v3}, Landroid/content/ClipData;->getItemCount()I

    move-result v4

    if-ge v1, v4, :cond_4

    invoke-virtual {v3, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v4

    aput-object v4, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 206
    :cond_3
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 207
    new-array v0, v0, [Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    aput-object v3, v0, v1

    .line 210
    :cond_4
    :goto_4
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity;->fileCb:Landroid/webkit/ValueCallback;

    invoke-interface {v1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 211
    iput-object v2, p0, Lnl/spanje2031/app/MainActivity;->fileCb:Landroid/webkit/ValueCallback;

    goto :goto_1

    .line 214
    :cond_5
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_1

    :cond_6
    move-object v0, v2

    goto :goto_4

    :cond_7
    move v0, v1

    goto/16 :goto_0
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 219
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    const-string v1, "(window.appBack&&window.appBack())?\'1\':\'0\'"

    new-instance v2, Lnl/spanje2031/app/MainActivity$5;

    invoke-direct {v2, p0}, Lnl/spanje2031/app/MainActivity$5;-><init>(Lnl/spanje2031/app/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 227
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    sput-object p0, Lnl/spanje2031/app/MainActivity;->current:Lnl/spanje2031/app/MainActivity;

    .line 50
    invoke-virtual {p0}, Lnl/spanje2031/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 51
    const/16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 52
    const-string v1, "#F6F1E9"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 53
    const-string v1, "#FFFDF9"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 54
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x2010

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 56
    invoke-static {p0}, Lnl/spanje2031/app/Notify;->channel(Landroid/content/Context;)V

    .line 57
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    .line 58
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    const-string v1, "#F6F1E9"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 59
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lnl/spanje2031/app/MainActivity;->setContentView(Landroid/view/View;)V

    .line 61
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 62
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 63
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 64
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 65
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 66
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 67
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 68
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 69
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    new-instance v1, Lnl/spanje2031/app/MainActivity$Bridge;

    invoke-direct {v1, p0}, Lnl/spanje2031/app/MainActivity$Bridge;-><init>(Lnl/spanje2031/app/MainActivity;)V

    const-string v2, "Android"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    new-instance v1, Lnl/spanje2031/app/MainActivity$1;

    invoke-direct {v1, p0}, Lnl/spanje2031/app/MainActivity$1;-><init>(Lnl/spanje2031/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 81
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    new-instance v1, Lnl/spanje2031/app/MainActivity$2;

    invoke-direct {v1, p0}, Lnl/spanje2031/app/MainActivity$2;-><init>(Lnl/spanje2031/app/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 98
    if-eqz p1, :cond_0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 100
    :goto_0
    return-void

    .line 99
    :cond_0
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    const-string v1, "file:///android_asset/index.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 113
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    const-string v0, "window.appPause&&window.appPause()"

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 116
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const-string v0, "window.appResume&&window.appResume()"

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->pendingUpdate:Ljava/lang/String;

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Lnl/spanje2031/app/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->pendingUpdate:Ljava/lang/String;

    iput-object v2, p0, Lnl/spanje2031/app/MainActivity;->pendingUpdate:Ljava/lang/String;

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->startUpdate(Ljava/lang/String;)V

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 118
    :cond_1
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->pendingUpdate:Ljava/lang/String;

    if-eqz v0, :cond_0

    iput-object v2, p0, Lnl/spanje2031/app/MainActivity;->pendingUpdate:Ljava/lang/String;

    const-string v0, "window.onUpdateStatus&&window.onUpdateStatus(\'noperm\',0)"

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 104
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 105
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity;->web:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 106
    return-void
.end method

.method updateFailed(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 44
    const-string v0, "window.onUpdateStatus&&window.onUpdateStatus(\'error\',0)"

    invoke-direct {p0, v0}, Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V

    return-void
.end method

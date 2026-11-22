.class Lnl/spanje2031/app/MainActivity$Bridge;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/spanje2031/app/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Bridge"
.end annotation


# instance fields
.field final synthetic this$0:Lnl/spanje2031/app/MainActivity;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity;)V
    .locals 0

    .prologue
    .line 231
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(I)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 263
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-class v2, Lnl/spanje2031/app/ReminderReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 264
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/high16 v2, 0x24000000

    invoke-static {v1, p1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 265
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v2, "alarm"

    invoke-virtual {v0, v2}, Lnl/spanje2031/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 266
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-virtual {v1}, Landroid/app/PendingIntent;->cancel()V

    .line 267
    :cond_0
    return-void
.end method

.method public copy(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 331
    const-string v1, "Spanje 2031"

    invoke-static {v1, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 332
    return-void
.end method

.method public deviceAuth()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 304
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Lnl/spanje2031/app/MainActivity$Bridge$5;

    invoke-direct {v1, p0}, Lnl/spanje2031/app/MainActivity$Bridge$5;-><init>(Lnl/spanje2031/app/MainActivity$Bridge;)V

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 310
    return-void
.end method

.method public deviceSecure()Z
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 299
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hash(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 315
    :try_start_0
    new-instance v0, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {p2, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const v3, 0x1d4c0

    const/16 v4, 0x100

    invoke-direct {v0, v1, v2, v3, v4}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 316
    const-string v1, "PBKDF2WithHmacSHA1"

    invoke-static {v1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v0

    invoke-interface {v0}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v0

    .line 317
    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 318
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, ""

    goto :goto_0
.end method

.method public installUpdate(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 237
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Lnl/spanje2031/app/MainActivity$Bridge$1;

    invoke-direct {v1, p0, p1}, Lnl/spanje2031/app/MainActivity$Bridge$1;-><init>(Lnl/spanje2031/app/MainActivity$Bridge;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 247
    return-void
.end method

.method public notify(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 250
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0, p1, p2, p3}, Lnl/spanje2031/app/Notify;->show(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public randomSalt()Ljava/lang/String;
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 323
    const/16 v0, 0x10

    new-array v0, v0, [B

    .line 324
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 325
    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public requestNotifPermission()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 271
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 272
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Lnl/spanje2031/app/MainActivity$Bridge$2;

    invoke-direct {v1, p0}, Lnl/spanje2031/app/MainActivity$Bridge$2;-><init>(Lnl/spanje2031/app/MainActivity$Bridge;)V

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 274
    :cond_0
    return-void
.end method

.method public saveFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 278
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Lnl/spanje2031/app/MainActivity$Bridge$3;

    invoke-direct {v1, p0, p2, p1}, Lnl/spanje2031/app/MainActivity$Bridge$3;-><init>(Lnl/spanje2031/app/MainActivity$Bridge;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 286
    return-void
.end method

.method public schedule(IJLjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 254
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-class v2, Lnl/spanje2031/app/ReminderReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 255
    const-string v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "title"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "body"

    invoke-virtual {v0, v1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 256
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/high16 v2, 0xc000000

    invoke-static {v1, p1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 257
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v2, "alarm"

    invoke-virtual {v0, v2}, Lnl/spanje2031/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 258
    if-eqz v0, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p2, p3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 259
    :cond_0
    return-void
.end method

.method public setSecure(Z)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 290
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Lnl/spanje2031/app/MainActivity$Bridge$4;

    invoke-direct {v1, p0, p1}, Lnl/spanje2031/app/MainActivity$Bridge$4;-><init>(Lnl/spanje2031/app/MainActivity$Bridge;Z)V

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 294
    return-void
.end method

.method public versionCode()I
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 233
    :try_start_0
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v1}, Lnl/spanje2031/app/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v2}, Lnl/spanje2031/app/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget v0, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

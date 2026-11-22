.class Lnl/spanje2031/app/MainActivity$Bridge$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity$Bridge;->deviceAuth()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnl/spanje2031/app/MainActivity$Bridge;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity$Bridge;)V
    .locals 0

    .prologue
    .line 304
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$Bridge$5;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 305
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$5;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 306
    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 307
    :goto_0
    if-nez v0, :cond_1

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$5;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onDeviceAuth&&window.onDeviceAuth(false)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    .line 309
    :goto_1
    return-void

    .line 306
    :cond_0
    const-string v1, "Spanje 2031 ontgrendelen"

    const-string v2, "Gebruik je vingerafdruk, gezicht of de pincode van je telefoon"

    invoke-virtual {v0, v1, v2}, Landroid/app/KeyguardManager;->createConfirmDeviceCredentialIntent(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_0

    .line 308
    :cond_1
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge$5;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v1, v1, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/16 v2, 0x2b

    invoke-virtual {v1, v0, v2}, Lnl/spanje2031/app/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1
.end method

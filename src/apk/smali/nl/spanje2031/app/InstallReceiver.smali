.class public Lnl/spanje2031/app/InstallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstallReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .prologue
    .line 11
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 12
    const-string v1, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 13
    const/16 v0, 0x2329

    const-string v1, "Spanje 2031 is bijgewerkt"

    const-string v2, "Tik om Spanje 2031 te openen."

    invoke-static {p1, v0, v1, v2}, Lnl/spanje2031/app/Notify;->show(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    :cond_0
    :goto_0
    return-void

    .line 16
    :cond_1
    const-string v0, "android.content.pm.extra.STATUS"

    const/16 v1, -0x3e7

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 17
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 18
    const-string v0, "android.intent.extra.INTENT"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 19
    if-eqz v0, :cond_0

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 20
    :cond_2
    if-eqz v0, :cond_0

    .line 21
    const-string v0, "android.content.pm.extra.STATUS_MESSAGE"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 22
    sget-object v1, Lnl/spanje2031/app/MainActivity;->current:Lnl/spanje2031/app/MainActivity;

    if-eqz v1, :cond_0

    sget-object v1, Lnl/spanje2031/app/MainActivity;->current:Lnl/spanje2031/app/MainActivity;

    if-nez v0, :cond_3

    const-string v0, ""

    :cond_3
    invoke-virtual {v1, v0}, Lnl/spanje2031/app/MainActivity;->updateFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

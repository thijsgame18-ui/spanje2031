.class Lnl/spanje2031/app/MainActivity$2;
.super Landroid/webkit/WebChromeClient;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnl/spanje2031/app/MainActivity;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$2;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback",
            "<[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v0, 0x1

    .line 84
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$2;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v1}, Lnl/spanje2031/app/MainActivity;->access$000(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/ValueCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$2;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v1}, Lnl/spanje2031/app/MainActivity;->access$000(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/ValueCallback;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 85
    :cond_0
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$2;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v1, p2}, Lnl/spanje2031/app/MainActivity;->access$002(Lnl/spanje2031/app/MainActivity;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 87
    :try_start_0
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object v1

    .line 88
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    move-result v2

    if-ne v2, v0, :cond_1

    const-string v2, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 89
    :cond_1
    iget-object v2, p0, Lnl/spanje2031/app/MainActivity$2;->this$0:Lnl/spanje2031/app/MainActivity;

    const/16 v3, 0x2a

    invoke-virtual {v2, v1, v3}, Lnl/spanje2031/app/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :goto_0
    return v0

    .line 90
    :catch_0
    move-exception v0

    .line 91
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$2;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0, v4}, Lnl/spanje2031/app/MainActivity;->access$002(Lnl/spanje2031/app/MainActivity;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 92
    const/4 v0, 0x0

    goto :goto_0
.end method

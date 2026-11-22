.class Lnl/spanje2031/app/MainActivity$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity;->onBackPressed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lnl/spanje2031/app/MainActivity;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity;)V
    .locals 0

    .prologue
    .line 219
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$5;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 219
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnl/spanje2031/app/MainActivity$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 222
    if-eqz p1, :cond_0

    const-string v0, "1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    :goto_0
    return-void

    .line 223
    :cond_0
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$5;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0}, Lnl/spanje2031/app/MainActivity;->access$100(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$5;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0}, Lnl/spanje2031/app/MainActivity;->access$100(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    goto :goto_0

    .line 224
    :cond_1
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$5;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0}, Lnl/spanje2031/app/MainActivity;->access$400(Lnl/spanje2031/app/MainActivity;)V

    goto :goto_0
.end method

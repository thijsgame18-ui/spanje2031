.class Lnl/spanje2031/app/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity;->js(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnl/spanje2031/app/MainActivity;

.field final synthetic val$code:Ljava/lang/String;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 109
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$3;->this$0:Lnl/spanje2031/app/MainActivity;

    iput-object p2, p0, Lnl/spanje2031/app/MainActivity$3;->val$code:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 109
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$3;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0}, Lnl/spanje2031/app/MainActivity;->access$100(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$3;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-static {v0}, Lnl/spanje2031/app/MainActivity;->access$100(Lnl/spanje2031/app/MainActivity;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$3;->val$code:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :cond_0
    return-void
.end method

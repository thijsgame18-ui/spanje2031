.class Lnl/spanje2031/app/MainActivity$4$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnl/spanje2031/app/MainActivity$4;

.field final synthetic val$u:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity$4;Landroid/net/Uri;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 168
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$4$1;->this$1:Lnl/spanje2031/app/MainActivity$4;

    iput-object p2, p0, Lnl/spanje2031/app/MainActivity$4$1;->val$u:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 170
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 171
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$4$1;->val$u:Landroid/net/Uri;

    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    const v1, 0x10000001

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 173
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$4$1;->this$1:Lnl/spanje2031/app/MainActivity$4;

    iget-object v1, v1, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v1, v0}, Lnl/spanje2031/app/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    :goto_0
    return-void

    .line 174
    :catch_0
    move-exception v0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4$1;->this$1:Lnl/spanje2031/app/MainActivity$4;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onUpdateStatus&&window.onUpdateStatus(\'error\',0)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    goto :goto_0
.end method

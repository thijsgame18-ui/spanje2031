.class Lnl/spanje2031/app/MainActivity$Bridge$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity$Bridge;->saveFile(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnl/spanje2031/app/MainActivity$Bridge;

.field final synthetic val$content:Ljava/lang/String;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity$Bridge;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 278
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iput-object p2, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->val$content:Ljava/lang/String;

    iput-object p3, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 279
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->val$content:Ljava/lang/String;

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$702(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 280
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 281
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 282
    const-string v1, "application/json"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 283
    const-string v1, "android.intent.extra.TITLE"

    iget-object v2, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->val$name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 284
    :try_start_0
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v1, v1, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/16 v2, 0x2c

    invoke-virtual {v1, v0, v2}, Lnl/spanje2031/app/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    :goto_0
    return-void

    .line 284
    :catch_0
    move-exception v0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$702(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$3;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onFileSaved&&window.onFileSaved(false)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    goto :goto_0
.end method

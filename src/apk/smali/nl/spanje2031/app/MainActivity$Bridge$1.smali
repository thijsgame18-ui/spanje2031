.class Lnl/spanje2031/app/MainActivity$Bridge$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity$Bridge;->installUpdate(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnl/spanje2031/app/MainActivity$Bridge;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity$Bridge;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 237
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iput-object p2, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 238
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v0}, Lnl/spanje2031/app/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v0

    if-nez v0, :cond_0

    .line 239
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->val$url:Ljava/lang/String;

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$502(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 240
    :try_start_0
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "package:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v4, v4, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v4}, Lnl/spanje2031/app/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lnl/spanje2031/app/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onUpdateStatus&&window.onUpdateStatus(\'perm\',0)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    .line 246
    :goto_0
    return-void

    .line 241
    :catch_0
    move-exception v0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$502(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->val$url:Ljava/lang/String;

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$600(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 245
    :cond_0
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$Bridge$1;->val$url:Ljava/lang/String;

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$600(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    goto :goto_0
.end method

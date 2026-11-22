.class Lnl/spanje2031/app/MainActivity$Bridge$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity$Bridge;->setSecure(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnl/spanje2031/app/MainActivity$Bridge;

.field final synthetic val$on:Z


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity$Bridge;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 290
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$Bridge$4;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iput-boolean p2, p0, Lnl/spanje2031/app/MainActivity$Bridge$4;->val$on:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/16 v1, 0x2000

    .line 291
    iget-boolean v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$4;->val$on:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$4;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v0}, Lnl/spanje2031/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 293
    :goto_0
    return-void

    .line 292
    :cond_0
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$4;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    invoke-virtual {v0}, Lnl/spanje2031/app/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0
.end method

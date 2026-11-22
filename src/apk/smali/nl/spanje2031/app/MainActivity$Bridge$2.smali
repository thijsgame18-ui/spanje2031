.class Lnl/spanje2031/app/MainActivity$Bridge$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity$Bridge;->requestNotifPermission()V
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
    .line 272
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$Bridge$2;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 272
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$Bridge$2;->this$1:Lnl/spanje2031/app/MainActivity$Bridge;

    iget-object v0, v0, Lnl/spanje2031/app/MainActivity$Bridge;->this$0:Lnl/spanje2031/app/MainActivity;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "android.permission.POST_NOTIFICATIONS"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Lnl/spanje2031/app/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method

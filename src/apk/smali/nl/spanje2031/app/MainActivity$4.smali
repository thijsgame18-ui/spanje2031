.class Lnl/spanje2031/app/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/spanje2031/app/MainActivity;->startUpdate(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnl/spanje2031/app/MainActivity;

.field final synthetic val$dm:Landroid/app/DownloadManager;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lnl/spanje2031/app/MainActivity;Landroid/app/DownloadManager;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 154
    iput-object p1, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    iput-object p2, p0, Lnl/spanje2031/app/MainActivity$4;->val$dm:Landroid/app/DownloadManager;

    iput-wide p3, p0, Lnl/spanje2031/app/MainActivity$4;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v1, 0x0

    .line 155
    move v2, v1

    :goto_0
    const/16 v0, 0x4b0

    if-ge v2, v0, :cond_2

    .line 156
    const-wide/16 v4, 0x190

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 157
    :goto_1
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4;->val$dm:Landroid/app/DownloadManager;

    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [J

    iget-wide v6, p0, Lnl/spanje2031/app/MainActivity$4;->val$id:J

    aput-wide v6, v4, v1

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 158
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-nez v3, :cond_3

    :cond_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_1
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onUpdateStatus&&window.onUpdateStatus(\'error\',0)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    .line 183
    :cond_2
    :goto_2
    return-void

    .line 159
    :cond_3
    const-string v3, "status"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 160
    const-string v4, "bytes_so_far"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 161
    const-string v6, "total_size"

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 162
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 163
    const/16 v0, 0x8

    if-ne v3, v0, :cond_4

    .line 164
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onUpdateStatus&&window.onUpdateStatus(\'install\',100)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    .line 165
    :try_start_1
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnl/spanje2031/app/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    const-string v3, "Spanje2031-update.apk"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$300(Lnl/spanje2031/app/MainActivity;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 166
    :catch_0
    move-exception v0

    .line 167
    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4;->val$dm:Landroid/app/DownloadManager;

    iget-wide v2, p0, Lnl/spanje2031/app/MainActivity$4;->val$id:J

    invoke-virtual {v0, v2, v3}, Landroid/app/DownloadManager;->getUriForDownloadedFile(J)Landroid/net/Uri;

    move-result-object v0

    .line 168
    iget-object v1, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v2, Lnl/spanje2031/app/MainActivity$4$1;

    invoke-direct {v2, p0, v0}, Lnl/spanje2031/app/MainActivity$4$1;-><init>(Lnl/spanje2031/app/MainActivity$4;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Lnl/spanje2031/app/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_2

    .line 179
    :cond_4
    const/16 v0, 0x10

    if-ne v3, v0, :cond_5

    iget-object v0, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    const-string v1, "window.onUpdateStatus&&window.onUpdateStatus(\'error\',0)"

    invoke-static {v0, v1}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    goto :goto_2

    .line 180
    :cond_5
    const-wide/16 v8, 0x0

    cmp-long v0, v6, v8

    if-lez v0, :cond_6

    const-wide/16 v8, 0x64

    mul-long/2addr v4, v8

    div-long/2addr v4, v6

    long-to-int v0, v4

    .line 181
    :goto_3
    iget-object v3, p0, Lnl/spanje2031/app/MainActivity$4;->this$0:Lnl/spanje2031/app/MainActivity;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "window.onUpdateStatus&&window.onUpdateStatus(\'download\',"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lnl/spanje2031/app/MainActivity;->access$200(Lnl/spanje2031/app/MainActivity;Ljava/lang/String;)V

    .line 155
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_0

    :cond_6
    move v0, v1

    .line 180
    goto :goto_3

    .line 156
    :catch_1
    move-exception v0

    goto/16 :goto_1
.end method

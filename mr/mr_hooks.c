 /*
 * This file contains device specific hooks.
 * Always enclose hooks to #if MR_DEVICE_HOOKS >= ver
 * with corresponding hook version!
 */

#include <stdio.h>
#include <unistd.h>
#include <dirent.h>
#include <ctype.h>
#include <string.h>
#include <sys/stat.h>

#include <log.h>

#if MR_DEVICE_HOOKS >= 1
int mrom_hook_after_android_mounts(const char *busybox_path, const char *base_path, int type)
{
    return 0;
}
#endif /* MR_DEVICE_HOOKS >= 1 */


#if MR_DEVICE_HOOKS >= 2
void mrom_hook_before_fb_close(void)
{
}
#endif /* MR_DEVICE_HOOKS >= 2 */


#if MR_DEVICE_HOOKS >= 3
void tramp_hook_before_device_init(void)
{
    FILE *f = fopen ("/sys/class/vtconsole/vtcon1/bind", "w+");
    if(!f)
    {
        ERROR("multirom: fbcon Failed to detach framebuffer console : %s!\n", strerror(errno));
        return;
    }
    fprintf(f, "%d", 0);
    fclose(f);

    INFO("multirom: detached fbcon (framebuffer console)");
    return;
}
#endif /* MR_DEVICE_HOOKS >= 3 */

#if MR_DEVICE_HOOKS >= 4
int mrom_hook_allow_incomplete_fstab(void)
{
    return 1;
}
#endif

#if MR_DEVICE_HOOKS >= 5
void mrom_hook_fixup_bootimg_cmdline(char *bootimg_cmdline, size_t bootimg_cmdline_cap)
{
}

int mrom_hook_has_kexec(void)
{
    return 0;
}
#endif

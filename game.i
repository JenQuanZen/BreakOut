# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 41 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 76 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1

typedef struct bullet {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rDel;
    int size;
    unsigned short color;
    int active;
    int erased;
} BULLET;


typedef struct ball {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rDel;
    int cDel;
    int size;
    unsigned short color;
} BALL;


typedef struct block {
    int row;
    int col;
    int oldCol;
    int oldRow;
    int rDel;
    int width;
    int height;
    unsigned short color;
    int erased;
    int active;
} BLOCK;


typedef struct paddle {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int cDel;
    int width;
    int height;
    unsigned short color;
    int bulletTimer;
} PADDLE;






extern BALL ball;
extern PADDLE paddle;
extern BULLET bullets[10];
extern BLOCK blocks[15];
extern int blocksRemaining;


void initializeGame();
void updateGame();
void drawGame();

void initializePaddle();
void updatePaddle();
void drawPaddle();

void initializeBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

void initializeBlocks();
void updateBlock(BLOCK *);
void drawBlock(BLOCK *);

void initializeBall();
void updateBall();
void drawBall();
# 3 "game.c" 2
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 1 3
# 29 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_newlib_version.h" 1 3
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 2 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\features.h" 1 3
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 30 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3





# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 1 3
# 45 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3
# 41 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3

# 41 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 2 3

# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 209 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 48 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 2 3
# 36 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 143 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef int ptrdiff_t;
# 321 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3



# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdarg.h" 1 3 4
# 40 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3
# 60 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 1 3
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 1 3
# 24 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 1 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 1 3 4
# 9 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 1 3 4
# 35 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 1 3 4
# 20 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 2 3 4
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef unsigned int __size_t;
# 145 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef signed int _ssize_t;
# 156 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 350 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 16 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3






typedef unsigned long __ULong;
# 38 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 61 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 1 3
# 28 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 63 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 2 3
# 113 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_pthreadtypes.h" 1 3
# 240 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\types.h" 1 3
# 241 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 2 3
# 62 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3




typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\stdio.h" 1 3
# 80 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3
# 186 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 266 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 396 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 577 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 741 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 797 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3

# 4 "game.c" 2



# 6 "game.c"
PADDLE paddle;
BALL ball;
BULLET bullets[10];
BLOCK blocks[15];
int blocksRemaining;
int level;


int pCollided;

int bCollided;

void initializeGame() {


    initializePaddle();
    initializeBullets();
    initializeBlocks();
    initializeBall();
    blocksRemaining = 15;
    level = 1;
}

void updateGame() {
    updateBall();
    updatePaddle();


    for (int i = 0; i < 15; i++) {
        updateBlock(&blocks[i]);
    }


    for (int j = 0; j < 10; j++) {
        updateBullet(&bullets[j]);
    }
}

void drawGame() {

    drawPaddle();
    drawBall();


    for (int i = 0; i < 15; i++) {
        if (!blocks[i].erased) {
            drawBlock(&blocks[i]);
        }
    }


    for (int j = 0; j < 10; j++) {
        drawBullet(&bullets[j]);
    }

}

void initializePaddle() {
    paddle.row = 150;
    paddle.col = 105;
    paddle.oldRow = paddle.row;
    paddle.oldCol = paddle.col;
    paddle.height = 5;
    paddle.width = 40;
    paddle.color = ((0) | (0)<<5 | (31)<<10);
    paddle.cDel = 0;
    paddle.bulletTimer = 20;
}


void drawPaddle() {
   drawRect(paddle.oldCol, paddle.oldRow, paddle.width, paddle.height, ((31) | (31)<<5 | (31)<<10));
   drawRect(paddle.col, paddle.row, paddle.width, paddle.height, paddle.color);

   paddle.oldCol = paddle.col;
}

void updatePaddle() {

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (paddle.col + paddle.width <= 239) {
            paddle.col += 1;
            paddle.cDel = 1;
        }
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (paddle.col > 0) {
            paddle.col -= 1;
            paddle.cDel = -1;
        }
    }


    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && paddle.bulletTimer >= 20) {
        fireBullet();
        paddle.bulletTimer = 0;
    }

    paddle.bulletTimer++;
}

void initializeBall() {
    ball.col = 115;
    ball.row = 80;
    ball.oldCol = ball.col;
    ball.oldRow = ball.row;
    ball.size = 5;
    ball.rDel = 1;
    ball.cDel = 0;
    ball.color = ((0) | (31)<<5 | (31)<<10);

}

void updateBall() {

    if (ball.row <= 0) {
        ball.rDel = - ball.rDel;
    }
    if (ball.col >= 239 || ball.col <= 0) {
        ball.cDel = - ball.cDel;
    }


    if (pCollided) {
        ball.row -= 2;
        pCollided = 0;
    }


    if (bCollided) {
        ball.row += 2;
        bCollided = 0;
    }


    if (collision(paddle.row, paddle.col, paddle.height, paddle.width, ball.row, ball.col, ball.size, ball.size)) {
        ball.rDel = -ball.rDel;
        ball.cDel += paddle.cDel;
        pCollided = 1;
    }


    ball.row += ball.rDel;
    ball.col += ball.cDel;

}

void drawBall() {
    drawRect(ball.oldCol, ball.oldRow, ball.size, ball.size, ((31) | (31)<<5 | (31)<<10));
    drawRect(ball.col, ball.row, ball.size, ball.size, ball.color);

   ball.oldCol = ball.col;
   ball.oldRow = ball.row;
}



void initializeBullets() {
    for (int i = 0; i < 10; i++) {
        bullets[i].size = 3;
        bullets[i].row = 0;
        bullets[i].col = 0;
        bullets[i].oldRow = paddle.oldRow;
        bullets[i].oldCol = paddle.oldCol;
        bullets[i].rDel = -2;
        bullets[i].color = ((0) | (31)<<5 | (0)<<10);
        bullets[i].active = 0;
        bullets[i].erased = 1;
    }
}

void fireBullet() {

    for (int i = 0; i < 10; i++) {
        if (!bullets[i].active) {


            bullets[i].col = paddle.col + paddle.width/2 - bullets[i].size/2;
            bullets[i].row = paddle.row;


            bullets[i].active = 1;
            bullets[i].erased = 0;

            break;
        }
    }
}

void drawBullet(BULLET * b) {
    if (b->active) {
        drawRect(b->oldCol, b->oldRow, b->size, b->size, ((31) | (31)<<5 | (31)<<10));
        drawRect(b->col, b->row, b->size, b->size, b->color);
    } else if (!b->erased) {
        drawRect(b->oldCol, b->oldRow, b->size, b->size, ((31) | (31)<<5 | (31)<<10));
        b->erased = 1;
    }
    b->oldRow = b->row;
    b->oldCol = b->col;
}

void updateBullet(BULLET * b) {

    if (b->active) {
        if (b->size + b->size - 1 >= 0) {
            b->row += b->rDel;
        } else {
            b->active = 0;
        }
    }
}

void initializeBlocks() {
        for (int i = 0; i < (15 / 3); i++) {
            blocks[i].height = 10;
            blocks[i].width = 30;
            blocks[i].row = 5;
            blocks[i].col = 5 + 50 * i;
            blocks[i].oldRow = blocks[i].row;
            blocks[i].oldCol = blocks[i].col;
            blocks[i].rDel = 0;
            blocks[i].color = ((15) | (8)<<5 | (8)<<10);
            blocks[i].erased = 0;
            blocks[i].active = 1;
        }
        for (int i = (15/3); i < (2 * 15 / 3); i++) {
            blocks[i].height = 10;
            blocks[i].width = 30;
            blocks[i].row = 20;
            blocks[i].col = 5 + 50 * (i-15/3);
            blocks[i].oldRow = blocks[i].row;
            blocks[i].oldCol = blocks[i].col;
            blocks[i].rDel = 0;
            blocks[i].color = ((15) | (8)<<5 | (8)<<10);
            blocks[i].erased = 0;
            blocks[i].active = 1;
        }
        for (int i = (2 * 15/3); i < 15; i++) {
            blocks[i].height = 10;
            blocks[i].width = 30;
            blocks[i].row = 35;
            blocks[i].col = 5 + 50 * (i - (2*15/3));
            blocks[i].oldRow = blocks[i].row;
            blocks[i].oldCol = blocks[i].col;
            blocks[i].rDel = 0;
            blocks[i].color = ((15) | (8)<<5 | (8)<<10);
            blocks[i].erased = 0;
            blocks[i].active = 1;
        }
}

void drawBlock(BLOCK * b) {
    if (b->active) {
        drawRect(b->col, b->row, b->width, b->height, b->color);
    } else if (!b->erased) {
        drawRect(b->oldCol, b->oldRow, b->width, b->height, ((31) | (31)<<5 | (31)<<10));
        b->erased = 1;
    }
}

void updateBlock(BLOCK * b) {

    if (b->active && collision(ball.row, ball.col, ball.size, ball.size, b->row, b->col, b->height, b->width)) {
        ball.rDel = -ball.rDel;
        blocksRemaining--;
        b->active = 0;
        bCollided = 1;
        b->row = -10;
    }


    for (int i = 0; i < 10; i++) {
        if (b->active && collision(bullets[i].row, bullets[i].col, bullets[i].size, bullets[i].size, b->row, b->col, b->height, b->width)) {
            bullets[i].active = 0;
            blocksRemaining--;
            b->active = 0;
            b->row = -10;
        }
    }
}

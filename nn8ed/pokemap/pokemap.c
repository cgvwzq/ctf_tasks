#include <stdio.h>
#include <string.h>
#include <emscripten.h>
#include "gmp-out/include/gmp.h"

int verify(char *input);
char *preprocess(char *f);
void init_table(int *dic);
void encode_godel(mpz_t *res, char *in, int *dic);
void ascii_to_num(char *in);

int verify(char *input) {
	char in[60];
	strncpy(in, input, 60);
	char *out = preprocess(in);
	if (!out) {
		return -1;
	}
	if (strlen(out) != 23) {
		return -1;
	}
	mpz_t res, key;
	int dic[100];
	init_table (dic);
	ascii_to_num (out);
	mpz_init(key);
	mpz_set_str(key, "113883417854804734205272931355440788694200827387648583857573676327442526053146613050094697446744879249099281785455568244741403049418901590085173000595652023976447723574801246421998377496953662081977205128192835695618595003013531897093602805275070643669720901544931208221907840144204782361806858863609452134200476917361844582139661076618317634669257493529304035162565317931423519182235607017253888631759822594276543440000", 10);
	encode_godel(&res, out, dic);
	return mpz_cmp (res, key); // this is my fail, I forgot to change it
}

void encode_godel(mpz_t *res, char *in, int *dic) {
	size_t len = strlen(in);
	mpz_t base, exp, tmp;

	mpz_init(*res);
	mpz_init(base);
	mpz_init(tmp);

	mpz_set_ui (*res, 1UL);

	for (int i=0; i<len; i++) {
		mpz_set_ui (base, (unsigned long)dic[i]);
		mpz_pow_ui(tmp, base, in[i]);
		mpz_mul (*res, *res, tmp);
	}
	return;
}

char *preprocess(char *f) {
	char *s = f, *e = NULL;
	while (s && *s != '\0' && *s != '{') s++;
	if (!s || *s == '\0') return NULL;
	s++;
	e = s;
	while (e && *e != '\0' && *e != '}') e++;
	if (!e || *e == '\0') return NULL;
	*e = '\0';
	return s;
}

void ascii_to_num(char *in) {
	size_t l = strlen(in);
	for (int i=0; i<l; i++) {
		if (in[i] >= 'a' && in[i] <= 'z') {
			in[i] = in[i] - 96;
		} else {
			in[i] = 0;
		}
	}
}

void init_table(int *dic) {
    int i, j, k, c = 0;
    for(i=2; i<=542; i++) {
        k=0;
        for(j=2;j<=i;j++) {
			if (i%j==0)
            k++;
        }
        if (k==1) {
			dic[c++] = i;
		}
    }
}

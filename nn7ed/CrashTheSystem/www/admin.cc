#include <node.h>
#include <string.h>

#define SECRET_PATH "bettersafethisinbookmarkslol"
#define USER "snuffles"
#define KEY "AIDS!"
#define PWD "6&(<Mq&t"

#define NODE_DEFINE_STRING_CONSTANT(target, constant, value)  {              \
    v8::Isolate* isolate = target->GetIsolate();                             \
    v8::Local<v8::Context> context = isolate->GetCurrentContext();           \
    v8::Local<v8::String> constant_name =                                    \
        v8::String::NewFromUtf8(isolate, constant);                          \
    v8::Local<v8::String> constant_value =                                   \
        v8::String::NewFromUtf8(isolate, value);                             \
    v8::PropertyAttribute constant_attributes =                              \
        static_cast<v8::PropertyAttribute>(v8::ReadOnly | v8::DontDelete);   \
    (target)->DefineOwnProperty(context,                                     \
                                constant_name,                               \
                                constant_value,                              \
                                constant_attributes).FromJust();             \
}

namespace auth {

using v8::Exception;
using v8::FunctionCallbackInfo;
using v8::Isolate;
using v8::Local;
using v8::Number;
using v8::Object;
using v8::String;
using v8::Value;
using v8::Boolean;

bool isValidUser(char *username) {
	if (strncmp(username, USER, strlen(USER)) == 0) {
		return true;
	} else {
		return false;
	}
}

bool isValidPwd(char *pwd) {
	size_t l = strlen(pwd);
	if (l != strlen(PWD)) {
		return false;
	}
	char tmp[32] = {0};
	unsigned char i;
	for (i = 0; i < strlen(PWD); i++) {
		tmp[i] = PWD[i] ^ KEY[i % strlen(KEY)];
	}
	tmp[i] = 0;
	if (strncmp(pwd, tmp, strlen(tmp)) == 0) {
		return true;
	} else {
		return false;
	}
}

void Auth(const FunctionCallbackInfo<Value>& args) {
	Isolate* isolate = args.GetIsolate();

	if (args.Length() < 2) {
		args.GetReturnValue().Set(v8::False(isolate));
		return;
	}

	Local<String> user = args[0]->ToString();
	Local<String> pwd = args[1]->ToString();

	if (!isValidUser(*String::Utf8Value(user))) {
		args.GetReturnValue().Set(v8::False(isolate));
		return;
	}

	if (!isValidPwd(*String::Utf8Value(pwd))) {
		args.GetReturnValue().Set(v8::False(isolate));
		return;
	}

	args.GetReturnValue().Set(v8::True(isolate));
}

void Init(Local<Object> exports) {
	NODE_SET_METHOD(exports, "authenticate", Auth);
	NODE_DEFINE_STRING_CONSTANT(exports, "SECRET_PATH", SECRET_PATH);	
}

NODE_MODULE(NODE_GYP_MODULE_NAME, Init)

} 

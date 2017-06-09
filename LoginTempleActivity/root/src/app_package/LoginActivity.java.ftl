package ${packageName};


import android.app.Activity;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;

import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;




public class ${activityClass} extends Activity {


   
    private RelativeLayout mRoot;
    private ImageView mLogo;
    private ScrollView mScrollView;
    private LinearLayout mContent;
    private EditText mEtMobile;
    private ImageView mIvCleanPhone;
    private EditText mEtPassword;
    private ImageView mCleanPassword;
    private ImageView mIvShowPwd;
    private Button mBtnLogin;
    private TextView mRegist;
    private TextView mForgetPassword;
    private LinearLayout mService;
   



    private int screenHeight = 0;//屏幕高度
    private int keyHeight = 0; //软件盘弹起后所占高度
    private float scale = 0.6f; //logo缩放比例
    private int height = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

       

        
        bindViews();
        initListener();
      
       initView();
        initEvent();
    }

    private void initView() {
        screenHeight = this.getResources().getDisplayMetrics().heightPixels; //获取屏幕高度
        keyHeight = screenHeight / 3;//弹起高度为屏幕高度的1/3
    }

    private void initEvent() {
        mEtMobile.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                if (!TextUtils.isEmpty(s) && mIvCleanPhone.getVisibility() == View.GONE) {
                    mIvCleanPhone.setVisibility(View.VISIBLE);
                } else if (TextUtils.isEmpty(s)) {
                    mIvCleanPhone.setVisibility(View.GONE);
                }
            }
        });
        mEtPassword.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                if (!TextUtils.isEmpty(s) && mCleanPassword.getVisibility() == View.GONE) {
                    mCleanPassword.setVisibility(View.VISIBLE);
                } else if (TextUtils.isEmpty(s)) {
                    mCleanPassword.setVisibility(View.GONE);
                }
                if (s.toString().isEmpty())
                    return;
                if (!s.toString().matches("[A-Za-z0-9]+")) {
                    String temp = s.toString();
                    Toast.makeText(mContext, "请输入数字或字母", Toast.LENGTH_SHORT).show();
                    s.delete(temp.length() - 1, temp.length());
                    mEtPassword.setSelection(s.length());
                }
            }
        });
    
    }


   






   
      private void bindViews() {

         mRoot = (RelativeLayout) findViewById(R.id.root);
         mLogo = (ImageView) findViewById(R.id.logo);
        mScrollView = (ScrollView) findViewById(R.id.scrollView);
        mContent = (LinearLayout) findViewById(R.id.content);
        mEtMobile = (EditText) findViewById(R.id.et_mobile);
        mIvCleanPhone = (ImageView) findViewById(R.id.iv_clean_phone);
        mEtPassword = (EditText) findViewById(R.id.et_password);
        mCleanPassword = (ImageView) findViewById(R.id.clean_password);
        mIvShowPwd = (ImageView) findViewById(R.id.iv_show_pwd);
        mBtnLogin = (Button) findViewById(R.id.btn_login);
        mRegist = (TextView) findViewById(R.id.regist);
        mForgetPassword = (TextView) findViewById(R.id.forget_password);
        mService = (LinearLayout) findViewById(R.id.service);
        }

         private void initListener() {
        MyClickListener myClickListener = new MyClickListener();
        mIvCleanPhone.setOnClickListener(myClickListener);
        mCleanPassword.setOnClickListener(myClickListener);
        mIvShowPwd.setOnClickListener(myClickListener);
    }


    class MyClickListener implements View.OnClickListener {

        @Override
        public void onClick(View view) {
            switch (view.getId()) {
                case R.id.iv_clean_phone:
                    mEtMobile.setText("");
                    break;
                case R.id.clean_password:
                    mEtPassword.setText("");
                    break;
                case R.id.iv_show_pwd:
                    if (mEtPassword.getInputType() != InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD) {
                        mEtPassword.setInputType(InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
                        mIvShowPwd.setImageResource(R.drawable.pass_visuable);
                    } else {
                        mEtPassword.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
                        mIvShowPwd.setImageResource(R.drawable.pass_gone);
                    }
                    String pwd = mEtPassword.getText().toString();
                    if (!TextUtils.isEmpty(pwd))
                        mEtPassword.setSelection(pwd.length());
                    break;
            }
        }
    }
}

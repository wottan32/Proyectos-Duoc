package cl.fap.tecnobencina;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;


import android.app.Activity;
import android.content.Intent;

import android.view.View.OnClickListener;

import android.widget.TextView;


import cl.fap.tecnobencina.clases.service.MOCEnums;

import cl.fap.tecnobencina.clases.service.MOCBasicHttpBinding_IServicio;


public class MainActivity extends AppCompatActivity implements OnClickListener, AdapterView.OnItemSelectedListener {

    private SaveTask mSaveTask = null;

    private View mProgressView;
    private View mChangeStatusFormView;

    private EditText mIdVentaView;
    private Spinner mSpinner;
    private EditText mRazonView;
    private Button mSaveButton;
    private Button mScanBtn;
    private int mRutUsuario;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mProgressView = findViewById(R.id.login_progress);
        mChangeStatusFormView = findViewById(R.id.change_status_form);

        mIdVentaView = (EditText) findViewById(R.id.id_venta);
        mSpinner = (Spinner) findViewById(R.id.spinner_actions);
        mSpinner.setOnItemSelectedListener(this);
        mRazonView = (EditText) findViewById(R.id.txt_razon);
        mSaveButton = (Button) findViewById(R.id.save_button);

        mSaveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                attemptSave();
            }
        });
        mScanBtn = (Button) findViewById(R.id.scan_button);
        mScanBtn.setOnClickListener(this);

        Intent myIntent = getIntent();
        mRutUsuario = myIntent.getIntExtra("rutUsuario", 0);
       /*  Toast.makeText(getApplicationContext(), mRutUsuario, Toast.LENGTH_SHORT).show();*/
    }

    private void attemptSave() {
        if (mSaveTask != null) {
            return;
        }

        // Reset errors.
        mIdVentaView.setError(null);
        mRazonView.setError(null);

        // Store values at the time of the save attempt.
        String id = mIdVentaView.getText().toString();
        //Toast.makeText(getApplicationContext(), id, Toast.LENGTH_SHORT).show();
        int selectedItem = mSpinner.getSelectedItemPosition();
        String razon = mRazonView.getText().toString();

        boolean cancel = false;
        View focusView = null;


        // Check for a valid id, if the user entered one.
        if (TextUtils.isEmpty(id)) {
            mIdVentaView.setError(getString(R.string.error_empty_venta_id));
            focusView = mIdVentaView;
            cancel = true;
        }
        if (selectedItem == 0) {
            mIdVentaView.setError(getString(R.string.error_empty_action));
            focusView = mIdVentaView;
            cancel = true;
        }

        if (selectedItem == 2 && razon.length() == 0) {
            mRazonView.setError(getString(R.string.error_empty_razon));
            focusView = mRazonView;
            cancel = true;
        }

        if (cancel) {
            // There was an error; don't attempt login and focus the first
            // form field with an error.
            focusView.requestFocus();
        } else {
            // Show a progress spinner, and kick off a background task to
            // perform the user login attempt.
            showProgress(true);
            mSaveTask = new SaveTask(Integer.parseInt(id), MOCEnums.EstadoVenta.values()[selectedItem], mRutUsuario, razon);
            mSaveTask.execute((Void) null);
        }
    }

    /**
     * Shows the progress UI and hides the login form.
     */
    @TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
    private void showProgress(final boolean show) {
        // On Honeycomb MR2 we have the ViewPropertyAnimator APIs, which allow
        // for very easy animations. If available, use these APIs to fade-in
        // the progress spinner.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
            int shortAnimTime = getResources().getInteger(android.R.integer.config_shortAnimTime);

            mChangeStatusFormView.setVisibility(show ? View.GONE : View.VISIBLE);
            mChangeStatusFormView.animate().setDuration(shortAnimTime).alpha(
                    show ? 0 : 1).setListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    mChangeStatusFormView.setVisibility(show ? View.GONE : View.VISIBLE);
                }
            });

            mProgressView.setVisibility(show ? View.VISIBLE : View.GONE);
            mProgressView.animate().setDuration(shortAnimTime).alpha(
                    show ? 1 : 0).setListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    mProgressView.setVisibility(show ? View.VISIBLE : View.GONE);
                }
            });
        } else {
            // The ViewPropertyAnimator APIs are not available, so simply show
            // and hide the relevant UI components.
            mProgressView.setVisibility(show ? View.VISIBLE : View.GONE);
            mChangeStatusFormView.setVisibility(show ? View.GONE : View.VISIBLE);
        }
    }


    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        //Toast.makeText(getApplicationContext(), "Clicked on: " + parent.getSelectedItemPosition(), Toast.LENGTH_SHORT).show();
        if (parent.getSelectedItem().toString().equals("Anular")) {
            mRazonView.setVisibility(view.VISIBLE);
        } else {
            mRazonView.setVisibility(view.GONE);
        }
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.scan_button) {
            IntentIntegrator scanIntegrator = new IntentIntegrator(this);
            scanIntegrator.initiateScan();
        }
    }

    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        IntentResult scanningResult = IntentIntegrator.parseActivityResult(requestCode, resultCode, intent);
        if (scanningResult != null) {
            String scanContent = scanningResult.getContents();
            if (scanContent != null) {
                if (isInteger(scanContent)) {
                    mIdVentaView.setText(scanContent);
                } else {
                    Toast.makeText(getApplicationContext(), getString(R.string.error_qr_format), Toast.LENGTH_SHORT).show();
                }
            } else {
                Toast.makeText(getApplicationContext(), getString(R.string.error_qr_aborted), Toast.LENGTH_SHORT).show();
            }
            //we have a result
        } else {
            Toast toast = Toast.makeText(getApplicationContext(), getString(R.string.error_qr_fatal), Toast.LENGTH_SHORT);
            toast.show();
        }
    }

    public static boolean isInteger(String s) {
        return isInteger(s, 10);
    }

    public static boolean isInteger(String s, int radix) {
        if (s.isEmpty()) return false;
        for (int i = 0; i < s.length(); i++) {
            if (i == 0 && s.charAt(i) == '-') {
                if (s.length() == 1) return false;
                else continue;
            }
            if (Character.digit(s.charAt(i), radix) < 0) return false;
        }
        return true;
    }

    public class SaveTask extends AsyncTask<Void, Void, Boolean> {

        private final int mId;
        private final MOCEnums.EstadoVenta mEstado;
        private final int mRutUsuario;
        private final String mRazon;

        SaveTask(int id, MOCEnums.EstadoVenta estado, int rutUsuario, String razon) {
            mId = id;
            mEstado = estado;
            mRutUsuario = rutUsuario;
            mRazon = razon;
        }


        @Override
        protected Boolean doInBackground(Void... params) {
            // TODO: attempt change status against a network service.
            try {
                // Simulate network access.
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                return false;
            }

            try {
                MOCEnums.EstadoVenta estado = MOCEnums.EstadoVenta.anulada;

                MOCBasicHttpBinding_IServicio service = new MOCBasicHttpBinding_IServicio();
                return service.SwitchStatusVenta(mId, mEstado, mRutUsuario, mRazon);
            } catch (java.lang.Exception ex) {
                String asd = ex.getMessage();
                Toast.makeText(getApplicationContext(), ex.getMessage(), Toast.LENGTH_SHORT).show();
                return false;
            }

        }

        @Override
        protected void onPostExecute(final Boolean success) {
            mSaveTask = null;
            showProgress(false);

            if (success) {
                // nextActivity();
                Toast.makeText(getApplicationContext(), getString(R.string.success_save), Toast.LENGTH_SHORT).show();
                mIdVentaView.requestFocus();
            } else {
                Toast.makeText(getApplicationContext(), getString(R.string.error_save), Toast.LENGTH_SHORT).show();
                mIdVentaView.requestFocus();
            }
        }

        @Override
        protected void onCancelled() {
            mSaveTask = null;
            showProgress(false);
        }


    }


}

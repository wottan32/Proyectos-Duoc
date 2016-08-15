@if($errors->count() > 0)
<div class="information-message">
    <div>
        <ul>
            @foreach($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
        <button class="close">Aceptar</button>
    </div>
</div>
@endif